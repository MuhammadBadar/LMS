using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class CourseScheduleDAL
    {
        #region CourseSchedule Operations
        public bool ManageCourseSchedule(CourseScheduleDE _sch, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageCourseSchedule";
                cmd.Parameters.AddWithValue("@id", _sch.Id);
                cmd.Parameters.AddWithValue("@logoBase64Path", _sch.LogoBase64Path);
                cmd.Parameters.AddWithValue("@description", _sch.Description);
                cmd.Parameters.AddWithValue("@courseId", _sch.CourseId);
                cmd.Parameters.AddWithValue("@orientationClass", _sch.OrientationClass);
                cmd.Parameters.AddWithValue("@startDate", _sch.StartDate);
                cmd.Parameters.AddWithValue("@createdOn", _sch.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _sch.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _sch.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _sch.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _sch.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _sch.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception )
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
        public List<CourseScheduleDE> SearchCourseSchedules(string whereClause, MySqlCommand cmd = null)
        {
            List<CourseScheduleDE> top = new List<CourseScheduleDE>();
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
                top = cmd.Connection.Query<CourseScheduleDE>("call lms.SearchCourseSchedule( '" + whereClause + "')").ToList();
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
        #region ClassTiming Operations
        public bool ManageClassTiming(ClassTimingDE ClassTiming, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageClassTiming";
                cmd.Parameters.AddWithValue("@id", ClassTiming.Id);
                cmd.Parameters.AddWithValue("@schId", ClassTiming.SchId);
                cmd.Parameters.AddWithValue("@weekDayId", ClassTiming.WeekDayId);
                cmd.Parameters.AddWithValue("@timeFrom", ClassTiming.TimeFrom);
                cmd.Parameters.AddWithValue("@timeTo", ClassTiming.TimeTo);
                cmd.Parameters.AddWithValue("@createdOn", ClassTiming.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", ClassTiming.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", ClassTiming.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", ClassTiming.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", ClassTiming.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", ClassTiming.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception )
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
        public List<ClassTimingDE> SearchClassTimings(string whereClause, MySqlCommand cmd = null)
        {
            List<ClassTimingDE> top = new List<ClassTimingDE>();
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
                top = cmd.Connection.Query<ClassTimingDE>("call lms.SearchClassTiming( '" + whereClause + "')").ToList();
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
