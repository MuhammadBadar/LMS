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
    public class SchDAL
    {
        #region Operations

        public bool ManageSch(SchDE sch, MySqlCommand? cmd)
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
                cmd.CommandText = "Manage_Sch";
                cmd.Parameters.AddWithValue("@prm_Id", sch.Id);
                cmd.Parameters.AddWithValue("@prm_UserId", sch.UserId);
                cmd.Parameters.AddWithValue("@prm_RoleId", sch.RoleId);
                cmd.Parameters.AddWithValue("@prm_ScheduleTypeId", sch.ScheduleTypeId);
                cmd.Parameters.AddWithValue("@prm_EffectiveDate", sch.EffectiveDate);
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
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                LMSDataContext.CloseMySqlConnection(cmd);
                cmd.Parameters.Clear();
            }
        }
        public bool AlterSch(SchDE sch, int? Id = null, MySqlCommand cmd = null)
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
                cmd.Parameters.Clear();
            }
        }
        public List<SchDE> SearchSch(string whereClause, MySqlCommand cmd = null)
        {
            List<SchDE> top = new List<SchDE>();
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
                top = cmd.Connection.Query<SchDE>("call lms.SearchSchedule( '" + whereClause + "')").ToList();
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
                cmd.Parameters.Clear();
            }
        }

        #endregion
        #region SchLine Operations
        public bool ManageSchLine(SchLineDE Events, MySqlCommand cmd = null)
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
                cmd.CommandText = "Manage_SchLine";
                cmd.Parameters.AddWithValue("@prm_Id", Events.Id);
                cmd.Parameters.AddWithValue("@prm_DayId", Events.DayId);
                cmd.Parameters.AddWithValue("@prm_SchId", Events.SchId);
                cmd.Parameters.AddWithValue("@prm_createdOn", Events.CreatedOn);
                cmd.Parameters.AddWithValue("@prm_createdBy", Events.CreatedById);
                cmd.Parameters.AddWithValue("@prm_modifiedOn", Events.ModifiedOn);
                cmd.Parameters.AddWithValue("@prm_modifiedBy", Events.ModifiedById);
                cmd.Parameters.AddWithValue("@prm_isActive", Events.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", Events.DBoperation.ToString());
                cmd.Parameters.AddWithValue("@prm_Filter", Events.DBoperation.ToString());

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
        public List<SchLineDE> SearchSchLine(string whereClause, MySqlCommand cmd = null)
        {
            List<SchLineDE> top = new List<SchLineDE>();
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
                top = cmd.Connection.Query<SchLineDE>("call lms.SearchSchLine( '" + whereClause + "')").ToList();
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
