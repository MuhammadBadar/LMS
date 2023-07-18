using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;

namespace LMS.DAL
{
    public class LectureDAL
    {
        #region DbOperations
        public bool ManageLecture(LectureDE _lec, MySqlCommand? cmd)
        {
            bool closeConnection = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                cmd.CommandText = "ManageLecture";
                cmd.Parameters.AddWithValue("id", _lec.Id);
                cmd.Parameters.AddWithValue("courseId", _lec.CourseId);

                cmd.Parameters.AddWithValue("topicId", _lec.TopicId);

                cmd.Parameters.AddWithValue("title", _lec.Title);
                cmd.Parameters.AddWithValue("description", _lec.Description);
                cmd.Parameters.AddWithValue("url", _lec.URL);
                cmd.Parameters.AddWithValue("createdOn", _lec.CreatedOn);
                cmd.Parameters.AddWithValue("createdById", _lec.CreatedById);
                cmd.Parameters.AddWithValue("modifiedOn", _lec.ModifiedOn);
                cmd.Parameters.AddWithValue("modifiedById", _lec.ModifiedById);
                cmd.Parameters.AddWithValue("isActive", _lec.IsActive);
                cmd.Parameters.AddWithValue("DbOperation", _lec.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (closeConnection)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<LectureDE> SearchLecture(string WhereClause, MySqlCommand cmd)
        {
            bool closeConnection = false;
            //WhereClause = string.Empty;
            List<LectureDE> lec = new List<LectureDE>();
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                lec = cmd.Connection.Query<LectureDE>("call lms.SearchLecture('" + WhereClause + "')").ToList();
                return lec;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnection)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        #endregion
    }
}
