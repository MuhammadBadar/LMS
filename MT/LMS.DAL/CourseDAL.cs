using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class CourseDAL
    {
        #region Operations
        public bool ManageCourse(CourseDE _course, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageCourse";
                cmd.Parameters.AddWithValue("@id", _course.Id);
                cmd.Parameters.AddWithValue("@title", _course.Title);
                cmd.Parameters.AddWithValue("@shortDescription", _course.ShortDescription);
                cmd.Parameters.AddWithValue("@logoBase64Path", _course.LogoBase64Path);
                cmd.Parameters.AddWithValue("@fee", _course.Fee);
                cmd.Parameters.AddWithValue("@createdOn", _course.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _course.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _course.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _course.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _course.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _course.DBoperation.ToString());

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
            }
        }
        public List<CourseDE> SearchCourses(string whereClause, MySqlCommand cmd = null)
        {
            List<CourseDE> top = new List<CourseDE>();
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
                top = cmd.Connection.Query<CourseDE>("call lms.SearchCourse( '" + whereClause + "')").ToList();
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
    }
}
