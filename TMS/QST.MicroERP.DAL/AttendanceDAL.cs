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
    public class AttendanceDAL
    {
        #region Operations

        public bool ManageAttendance(AttendanceDE attnd, MySqlCommand cmd = null)
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
                else { 
                    Console.WriteLine("Connection error");}
                cmd.CommandText = "ManageAttendance";
                cmd.Parameters.AddWithValue("@id", attnd.Id);
                cmd.Parameters.AddWithValue("@userId", attnd.UserId);
                cmd.Parameters.AddWithValue("@inTime", attnd.InTime);
                cmd.Parameters.AddWithValue("@outTime", attnd.OutTime);
                cmd.Parameters.AddWithValue("@workingHours", attnd.WorkingHours);
                cmd.Parameters.AddWithValue("@createdOn", attnd.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", attnd.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", attnd.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", attnd.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", attnd.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", attnd.DBoperation.ToString());

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
        public bool AlterAttendance(AttendanceDE Attendance, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterAttendance";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", Attendance.DBoperation.ToString());
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
      
        public List<AttendanceDE> SearchAttendances(string whereClause, MySqlCommand cmd = null)
        {
            List<AttendanceDE> top = new List<AttendanceDE>();
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
                top = cmd.Connection.Query<AttendanceDE>("call mrcroerp.SearchAttendance( '" + whereClause + "')").ToList();
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
