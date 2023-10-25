using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;

namespace LMS.DAL
{
    public class AssignTaskDAL
    {
        public bool ManageAssignTask(AssignTaskDE _assignTask, MySqlCommand? cmd)
        {
            bool closeConnection = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                cmd.CommandText = "ManageAssignTask";
                cmd.Parameters.AddWithValue("id", _assignTask.Id);
                cmd.Parameters.AddWithValue("lectureId", _assignTask.LectureId);
                cmd.Parameters.AddWithValue("studentId", _assignTask.StudentId);
                cmd.Parameters.AddWithValue("createdOn", _assignTask.CreatedOn);
                cmd.Parameters.AddWithValue("createdById", _assignTask.CreatedById);
                cmd.Parameters.AddWithValue("modifiedOn", _assignTask.ModifiedOn);
                cmd.Parameters.AddWithValue("modifiedById", _assignTask.ModifiedById);
                cmd.Parameters.AddWithValue("isActive", _assignTask.IsActive);
                cmd.Parameters.AddWithValue("DbOperation", _assignTask.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
            finally
            {
                if (closeConnection)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<AssignTaskDE> SearchAssignTask(string WhereClause, MySqlCommand cmd)
        {
            bool closeConnection = false;
            List<AssignTaskDE> assignedTasks = new List<AssignTaskDE>();
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                assignedTasks = cmd.Connection.Query<AssignTaskDE>("call lms.SearchAssignTask('" + WhereClause + "')").ToList();
                return assignedTasks;
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
    }
}