using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.DAL
{
    public class UserTaskDAL
    {
        #region DbOperations
        public bool Manageusertask(UserTaskDE _tsk, MySqlCommand? cmd)
        {
            bool closeConnection = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                cmd.CommandText = "ManageUserTask";
                cmd.Parameters.AddWithValue("id", _tsk.Id);
                cmd.Parameters.AddWithValue("userId", _tsk.UserId);

                cmd.Parameters.AddWithValue("taskId", _tsk.TaskId);

                cmd.Parameters.AddWithValue("parent", _tsk.Parent);
                cmd.Parameters.AddWithValue("date", _tsk.Date);
                cmd.Parameters.AddWithValue("claimId", _tsk.ClaimId);
                /*cmd.Parameters.AddWithValue("claim", _tsk.Claim);*/
                cmd.Parameters.AddWithValue("sp", _tsk.Sp);
                cmd.Parameters.AddWithValue("comments", _tsk.Comments);
                cmd.Parameters.AddWithValue("reviewedby", _tsk.ReviewedBy);
                cmd.Parameters.AddWithValue("reviewcomments", _tsk.ReviewComments);
                cmd.Parameters.AddWithValue("createdOn", _tsk.CreatedOn);
                cmd.Parameters.AddWithValue("createdById", _tsk.CreatedById);
                cmd.Parameters.AddWithValue("modifiedOn", _tsk.ModifiedOn);
                cmd.Parameters.AddWithValue("modifiedById", _tsk.ModifiedById);
                cmd.Parameters.AddWithValue("isActive", _tsk.IsActive);
                cmd.Parameters.AddWithValue("DbOperation", _tsk.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (closeConnection)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<UserTaskDE> Searchusertask(string WhereClause, MySqlCommand cmd)
        {
            bool closeConnection = false;
            //WhereClause = string.Empty;
            List<UserTaskDE> lec = new List<UserTaskDE>();
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                lec = cmd.Connection.Query<UserTaskDE>("call lms.SearchUserTask('" + WhereClause + "')").ToList();
                return lec;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnection)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        #endregion
    }
}

    
