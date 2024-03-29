﻿

using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QST.MicroERP.Core.ViewModel;
using System.IO;
using QST.MicroERP.DAL;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;

namespace QST.MicroERP.Services
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
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

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

                QAFastTrackDataContext.EndTransaction(cmd);
            }
            catch
            {
                mod.HasErrors = true;
                QAFastTrackDataContext.CancelTransaction(cmd);
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return mod;

        }
        public List<TaskVM> SearchTasks(TaskSearchCriteria mod )
        {
            List<TaskVM> Task = new List<TaskVM>();
            List < AttachmentsDE> attchmt = new List<AttachmentsDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

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

                QAFastTrackDataContext.EndTransaction(cmd);
            }
            catch (Exception exp)
            {
                QAFastTrackDataContext.CancelTransaction(cmd);
                throw exp;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return Task;
        }

        #endregion

    }
}
