using Dapper;
using LMS.Core.ViewModel;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class AttendanceDAL
    {
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
