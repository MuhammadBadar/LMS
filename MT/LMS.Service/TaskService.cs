

using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using LMS.MicroERP.DAL;
using LMS.Core.Entities;
using LMS.DAL;
using LMS.Core.Enums;
using LMS.Core.ViewModel;
using LMS.Core.SearchCriteria;

namespace LMS.MicroERP.Services
{
    public class TaskService
    {

        #region Class Members/Class Variables
        private readonly string AppDirectory = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");
        private TaskDAL _taskDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public TaskService()
        {
            _taskDAL = new TaskDAL();
            _corDAL = new CoreDAL();
        }

        #endregion
        #region Task
        public TaskDE ManagementTask(TaskDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                mod.HasErrors = false;
                bool check = true;
                cmd =LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.task.ToString());                 
                    if (mod.Id == 1)
                        mod.Id = 1001;
                    check = _taskDAL.ManageTask(mod);
                    foreach (var file in mod.Attachments)
                    {
                        if (!Directory.Exists(AppDirectory))
                            Directory.CreateDirectory(AppDirectory);
                        var FileName = DateTime.Now.Ticks.ToString() + Path.GetExtension(file.Name);
                        var path = Path.Combine(AppDirectory, FileName);
                        file.DocPath = path;

                        file.Id = _corDAL.GetnextId(TableNames.attachments.ToString());
                        file.TaskId = mod.Id;
                        file.DBoperation = mod.DBoperation;
                        check = _taskDAL.ManageAttachments(file);

                    }
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _taskDAL.ManageTask(mod);
                    foreach (var file in mod.Attachments)
                    {
                        if (!Directory.Exists(AppDirectory))
                            Directory.CreateDirectory(AppDirectory);
                        var FileName = DateTime.Now.Ticks.ToString() + Path.GetExtension(file.Name);
                        var path = Path.Combine(AppDirectory, FileName);
                        file.DocPath = path;

                        switch (file.DBoperation)
                        {
                            case DBoperations.Insert:
                                {
                                    file.TaskId = mod.Id;
                                    file.Id = _corDAL.GetnextId(TableNames.attachments.ToString());
                                    check = _taskDAL.ManageAttachments(file);
                                }

                                break;
                            case DBoperations.Delete:
                                check = _taskDAL.AlterAttachments(file, file.Id);
                                break;
                            case DBoperations.DeActivate:
                                check = _taskDAL.AlterAttachments(file, file.Id);
                                break;
                        }
                    }
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _taskDAL.AlterTask(mod);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _taskDAL.AlterTask(mod);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _taskDAL.AlterTask(mod);
                }
                if (check == true)
                    mod.DBoperation = DBoperations.NA;

                LMSDataContext.EndTransaction(cmd);
            }
            catch
            {
                mod.HasErrors = true;
                LMSDataContext.CancelTransaction(cmd);
            }
            finally
            {
                if (cmd != null)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return mod;

        }


        public List<UserTaskVM> GetTasksByUserId(string userId)
        {
            List<UserTaskVM> tasks = new List<UserTaskVM>();
            List<AttachmentsDE> attachments = new List<AttachmentsDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                string whereClause = $"WHERE UserId = '{userId}' AND IsActive = 1 AND (statusId = {(int)Status.Open} OR statusId = {(int)Status.InProgress} ) "; // Assuming IsActive is a column indicating active tasks

                tasks = _taskDAL.SearchTasks(whereClause);

                // Fetch attachments for each task
                foreach (var task in tasks)
                {
                    attachments = _taskDAL.SearchAttachments($"AND TaskId = {task.Id}");
                    task.Attachments = attachments;
                }

                LMSDataContext.EndTransaction(cmd);
            }
            catch (Exception exp)
            {
                LMSDataContext.CancelTransaction(cmd);
                throw exp;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return tasks;
        }

        public List<UserTaskVM> SearchTasks(TaskSearchCriteria mod )
        {
            List<UserTaskVM> Task = new List<UserTaskVM>();
            List < AttachmentsDE> attchmt = new List<AttachmentsDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                #region Search

                string whereClause ;

                    whereClause = "where 1=1";
                    if (mod.Id != default)
                        whereClause += $" AND Id={mod.Id}";
                    if (mod.IsActive != default)
                        whereClause += $" AND IsActive={mod.IsActive}";
                    if (mod.UserId != default)
                        whereClause += $" AND UserId like ''{mod.UserId}''";
                if (mod.ModuleId != default)
                        whereClause += $" AND ModuleId={mod.ModuleId}";
                    if (mod.StatusId != default)
                        whereClause += $" AND StatusId={mod.StatusId}";
                    if (mod.User != default)
                        whereClause += $" AND User like ''{mod.User}''";
                if (mod.PriorityId != default)
                    whereClause += $" AND PriorityId={mod.PriorityId}";
                if (mod.TaskPriority != default)
                    whereClause += $" AND TaskPriority like ''{mod.TaskPriority}''";
                if (mod.Module != default)
                        whereClause += $" AND Module like ''{mod.Module}''";
                    if (mod.Status != default)
                        whereClause += $" AND Status like ''{mod.Status}''";
                    if (mod.SP != default)
                        whereClause += $" AND SP={mod.SP}";
                    if (mod.Title != default)
                    {
                        if (mod.Title != "")
                            whereClause += $" AND Title like ''{mod.Title}''";
                    }
                    if (mod.Description != default)
                    {
                        if (mod.Description !="")
                            whereClause += $" AND Description like ''{mod.Description}''";
                    }
            
                Task = _taskDAL.SearchTasks(whereClause);
                 whereClause = "where 1=1";
                foreach (var line in Task)
                {
                    line.Attachments = _taskDAL.SearchAttachments(whereClause += $" AND TaskId={line.Id}");
                }

                #endregion

                LMSDataContext.EndTransaction(cmd);
            }
            catch (Exception exp)
            {
                LMSDataContext.CancelTransaction(cmd);
                throw exp;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return Task;
        }

        #endregion

    }
}
