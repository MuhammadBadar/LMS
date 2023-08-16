using Dapper;
using LMS.Core.Entities;
using Microsoft.Extensions.Logging;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.DAL
{
    public class ScheduleDAL
    {
        #region Operations

        public bool ManageSchedule(ScheduleDE sch, MySqlCommand? cmd)
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
                cmd.CommandText = "Manage_Schedule";
                cmd.Parameters.AddWithValue("@prm_Id", sch.Id);
                cmd.Parameters.AddWithValue("@prm_UserId", sch.UserId);
                cmd.Parameters.AddWithValue("@prm_RoleId", sch.RoleId);
                cmd.Parameters.AddWithValue("@prm_EntityId", sch.EntityId);
                cmd.Parameters.AddWithValue("@prm_ScheduleTypeId", sch.ScheduleTypeId);
                cmd.Parameters.AddWithValue("@prm_WorkingTypeId", sch.WorkingTypeId);
                cmd.Parameters.AddWithValue("@prm_WorkingHours", sch.WorkingHours);
                cmd.Parameters.AddWithValue("@prm_StartDate", sch.StartDate);
                cmd.Parameters.AddWithValue("@prm_EndDate", sch.EndDate);
                cmd.Parameters.AddWithValue("@prm_CreatedOn", sch.CreatedOn);
                cmd.Parameters.AddWithValue("@prm_CreatedBy", sch.CreatedById);
                cmd.Parameters.AddWithValue("@prm_ModifiedOn", sch.ModifiedOn);
                cmd.Parameters.AddWithValue("@prm_ModifiedBy", sch.ModifiedById);
                cmd.Parameters.AddWithValue("@prm_IsActive", sch.IsActive);
                cmd.Parameters.AddWithValue("@prm_DBoperation", sch.DBoperation.ToString());
                cmd.Parameters.AddWithValue("@prm_Filter", sch.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public bool AlterSchedule(ScheduleDE sch, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterSchedule";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", sch.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<ScheduleDE> SearchSchedule(string whereClause, MySqlCommand cmd = null)
        {
            List<ScheduleDE> top = new List<ScheduleDE>();
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
                top = cmd.Connection.Query<ScheduleDE>("call lms.SearchSchedule( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }

        #endregion
        #region ScheduleDayEvents Operations
        public bool ManageScheduleDayEvents(ScheduleDaysEventsDE Events, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageScheduleDayEvents";
                cmd.Parameters.AddWithValue("@Id", Events.Id);
                cmd.Parameters.AddWithValue("@StartTime", Events.StartTime);
                cmd.Parameters.AddWithValue("@EndTime", Events.EndTime);
                cmd.Parameters.AddWithValue("@EventTypeId", Events.EventTypeId);
                cmd.Parameters.AddWithValue("@schId", Events.SchId); 
                cmd.Parameters.AddWithValue("@prm_DAYId", Events.DAYId);
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
        public List<ScheduleDaysEventsDE> SearchScheduleDayEvents(string whereClause, MySqlCommand cmd = null)
        {
            List<ScheduleDaysEventsDE> top = new List<ScheduleDaysEventsDE>();
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
                top = cmd.Connection.Query<ScheduleDaysEventsDE>("call lms.SearchScheduleDayEvents( '" + whereClause + "')").ToList();
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
