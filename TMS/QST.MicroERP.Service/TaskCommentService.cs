

using MySql.Data.MySqlClient;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
using QST.MicroERP.Core.ViewModel;
using QST.MicroERP.DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace QST.MicroERP.Services
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
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

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

                QAFastTrackDataContext.EndTransaction(cmd);
            }
            catch
            {
                QAFastTrackDataContext.CancelTransaction(cmd);
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
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
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

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
