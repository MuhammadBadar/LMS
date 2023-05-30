using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class CourseDetailDAL
    {
        #region Operations
        public bool ManageCourseDetail(CourseDetailDE _CourseDetail, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageCourseDetail";
                cmd.Parameters.AddWithValue("@id", _CourseDetail.Id);
                cmd.Parameters.AddWithValue("@projectTitle", _CourseDetail.ProjectTitle);
                cmd.Parameters.AddWithValue("@projectLogoBase64Path", _CourseDetail.ProjectLogoBase64Path);
                cmd.Parameters.AddWithValue("@projectKeyPoints", _CourseDetail.ProjectKeyPoints);
                cmd.Parameters.AddWithValue("@reasonToJoin", _CourseDetail.ReasonToJoin);
                cmd.Parameters.AddWithValue("@courseCurriculum", _CourseDetail.CourseCurriculum);
                cmd.Parameters.AddWithValue("@iconBase64Path", _CourseDetail.IconBase64Path);
                cmd.Parameters.AddWithValue("@title", _CourseDetail.Title);
                cmd.Parameters.AddWithValue("@shortDetail", _CourseDetail.ShortDetail);
                cmd.Parameters.AddWithValue("@createdOn", _CourseDetail.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _CourseDetail.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _CourseDetail.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _CourseDetail.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _CourseDetail.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _CourseDetail.DBoperation.ToString());

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
        public List<CourseDetailDE> SearchCourseDetails(string whereClause, MySqlCommand cmd = null)
        {
            List<CourseDetailDE> top = new List<CourseDetailDE>();
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
                top = cmd.Connection.Query<CourseDetailDE>("call lms.SearchCourseDetail( '" + whereClause + "')").ToList();
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
