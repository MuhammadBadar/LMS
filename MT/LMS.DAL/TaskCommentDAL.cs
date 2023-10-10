using Dapper;
using LMS.Core.Entities;
using LMS.Core.ViewModel;
using LMS.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.MicroERP.DAL
{
   public class TaskCommentDAL
    {
        #region Operations

        public bool ManageTaskComment(TaskCommentDE taskc, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "ManageTaskComment";
                cmd.Parameters.AddWithValue("@id", taskc.Id);
                cmd.Parameters.AddWithValue("@taskId", taskc.TaskId);
                cmd.Parameters.AddWithValue("@userId", taskc.UserId != null ? taskc.UserId : String.Empty);
                cmd.Parameters.AddWithValue("@comment", taskc.Comment);
                cmd.Parameters.AddWithValue("@time", taskc.Time);
                cmd.Parameters.AddWithValue("@createdOn", taskc.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", taskc.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", taskc.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", taskc.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", taskc.IsActive);
                cmd.Parameters.AddWithValue("@filter", taskc.DBoperation.ToString());

                cmd.ExecuteNonQuery();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public bool AlterTaskComment(TaskCommentDE taskc,  MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");

                cmd.CommandText = "AlterTaskComments";
                cmd.Parameters.AddWithValue("@id", taskc.Id);
                cmd.Parameters.AddWithValue("@filter", taskc.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception exp)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<TaskCommentVM> SearchTaskComments(string whereClause, MySqlCommand cmd = null)
        {
            List<TaskCommentVM> top = new List<TaskCommentVM>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                top = cmd.Connection.Query<TaskCommentVM>("call lms.SearchTaskComments( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception exp)
            {
                return top;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }

        #endregion

    }
}
