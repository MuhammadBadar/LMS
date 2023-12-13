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
    public class ScheduleDayEventDAL
    {
        #region ScheduleDayEvents Operations
        public bool ManageScheduleDayEvent(ScheduleDayEventDE Events, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageScheduleDayEvent";
                cmd.Parameters.AddWithValue("@Id", Events.Id);
                cmd.Parameters.AddWithValue("@StartTime", Events.StartTime);
                cmd.Parameters.AddWithValue("@EndTime", Events.EndTime);
                cmd.Parameters.AddWithValue("@EventTypeId", Events.EventTypeId);
                cmd.Parameters.AddWithValue("@Sp", Events.Sp);
                cmd.Parameters.AddWithValue("@SchId", Events.SchId);
                cmd.Parameters.AddWithValue("@ScheduleDayId", Events.SchDayId);
                cmd.Parameters.AddWithValue("@LocationId", Events.LocationId);
                cmd.Parameters.AddWithValue("@createdOn", Events.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", Events.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", Events.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", Events.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", Events.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", Events.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
                cmd.Parameters.Clear();
            }
        }
        public List<ScheduleDayEventDE> SearchScheduleDayEvent(string whereClause, MySqlCommand cmd = null)
        {
            List<ScheduleDayEventDE> top = new List<ScheduleDayEventDE>();
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
                top = cmd.Connection.Query<ScheduleDayEventDE>("call lms.SearchScheduleDayEvent( '" + whereClause + "')").ToList();
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
                cmd.Parameters.Clear();
            }
        }
        #endregion
    }
}
