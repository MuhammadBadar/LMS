using Dapper;
using MySql.Data.MySqlClient;
using QST.MicroERP.Core.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.DAL
{
    public class LogEventDAL
    {
        #region Operations

        public bool ManageLogEvent(LogEventDE levent, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                {
                    Console.WriteLine("Connection error");
                }
                cmd.CommandText = "ManageLogEvent";
                cmd.Parameters.AddWithValue("@id", levent.Id);
                cmd.Parameters.AddWithValue("@userId", levent.UserId);
                cmd.Parameters.AddWithValue("@action", levent.Action);
                cmd.Parameters.AddWithValue("@message", levent.Message);
                cmd.Parameters.AddWithValue("@createdOn", levent.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", levent.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", levent.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", levent.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", levent.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", levent.DBoperation.ToString());

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
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        public bool AlterLogEvent(LogEventDE LogEvent, int? Id = null, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "AlterLogEvent";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", LogEvent.DBoperation.ToString());
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
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }

        public List<LogEventDE> SearchLogEvents(string whereClause, MySqlCommand cmd = null)
        {
            List<LogEventDE> top = new List<LogEventDE>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                top = cmd.Connection.Query<LogEventDE>("call mrcroerp.SearchLogEvent( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception exp)
            {

                return top;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }


        #endregion
    }
}
