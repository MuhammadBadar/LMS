

using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Core.SearchCriteria;
using LMS.Core.ViewModel;
using LMS.DAL;
using LMS.MicroERP.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace LMS.Services
{
    public class TaskCommentService
    {

        #region Class Members/Class Variables

        private TaskCommentDAL _taskDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public TaskCommentService()
        {
            _taskDAL = new TaskCommentDAL();
            _corDAL = new CoreDAL();
        }

        #endregion
        #region TaskComment
        public bool ManagementTaskComment(TaskCommentDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.taskcomment.ToString());
                    check = _taskDAL.ManageTaskComment(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _taskDAL.ManageTaskComment(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _taskDAL.AlterTaskComment(mod);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _taskDAL.AlterTaskComment(mod);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _taskDAL.AlterTaskComment(mod);
                }
                if (check == true)
                    mod.DBoperation = DBoperations.NA;

                LMSDataContext.EndTransaction(cmd);
            }
            catch
            {
                LMSDataContext.CancelTransaction(cmd);
            }
            finally
            {
                if (cmd != null)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return true;

        }
        public List<TaskCommentVM> SearchTaskComments(TaskCommentSearchCriteria mod)
        {
            List<TaskCommentVM> Task = new List<TaskCommentVM>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.TaskId != default)
                    whereClause += $" AND TaskId={mod.TaskId}";
                if (mod.Comment != default)
                    whereClause += $" AND Comment like ''{mod.Comment}''";
                if (mod.User != default)
                    whereClause += $" AND User like ''{mod.User}''";
                if (mod.TaskTitle != default)
                    whereClause += $" AND TaskTitle like ''{mod.TaskTitle}''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Task = _taskDAL.SearchTaskComments(whereClause);

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
