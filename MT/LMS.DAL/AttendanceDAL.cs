using Dapper;
using LMS.Core.Entities;
using LMS.Core.ViewModel;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class AttendanceDAL
    {
        public bool ManageAttendance(AttendanceVM Attendance, MySqlCommand? cmd)
        {
            bool closeConnection = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                cmd.CommandText = "ManageAttendance";
                cmd.Parameters.AddWithValue("prm_Id", Attendance.Id);
                cmd.Parameters.AddWithValue("prm_User", Attendance.User);
                cmd.Parameters.AddWithValue("prm_InTime", Attendance.InTime);
                cmd.Parameters.AddWithValue("prm_OutTime", Attendance.OutTime);
                cmd.Parameters.AddWithValue("prm_WorkedHours", Attendance.WorkedHours);
                cmd.Parameters.AddWithValue("prm_Date", Attendance.Date);
                //cmd.Parameters.AddWithValue("modifiedOn", Attendance.ModifiedOn);
                //cmd.Parameters.AddWithValue("modifiedById", Attendance.ModifiedById);
                //cmd.Parameters.AddWithValue("isActive", Attendance.IsActive);
                //cmd.Parameters.AddWithValue("DbOperation", Attendance.DBoperation.ToString());
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

        public List<AttendanceVM> SearchAttendance(string whereClause, MySqlCommand cmd = null)
        {
           
            List<AttendanceVM> top = new List<AttendanceVM>();
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
                top = cmd.Connection.Query<AttendanceVM>("call lms.SearchAttendance( '" + whereClause + "')").ToList();
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

    }
}
