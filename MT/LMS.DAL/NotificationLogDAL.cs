using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.DAL
{
    public class NotificationLogDAL
    {
        #region Operations

        public bool ManageNotificationLog(NotificationLogDE log, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd =LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "ManageNotificationLog";
                cmd.Parameters.AddWithValue("@id", log.Id);
                cmd.Parameters.AddWithValue("@userId", log.UserId);
                cmd.Parameters.AddWithValue("@sMS", log.SMS);
                cmd.Parameters.AddWithValue("@isSent", log.IsSent);
                cmd.Parameters.AddWithValue("@phone", log.Phone);
                cmd.Parameters.AddWithValue("@dateTime", log.DateTime);
                cmd.Parameters.AddWithValue("@createdOn", log.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", log.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", log.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", log.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", log.IsActive);
                cmd.Parameters.AddWithValue("@filter", log.DBoperation.ToString());

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
        public bool AlterNotificationLog(NotificationLogDE NotificationLog, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterNotificationLog";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@filter", NotificationLog.DBoperation.ToString());
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
        public List<NotificationLogDE> SearchNotificationLogs(string whereClause, MySqlCommand cmd = null)
        {
            List<NotificationLogDE> top = new List<NotificationLogDE>();
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
                top = cmd.Connection.Query<NotificationLogDE>("call lms.SearchNotificationLog( '" + whereClause + "')").ToList();
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
