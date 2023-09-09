using Dapper;
using QST.MicroERP.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.DAL
{
    public class LectureDAL
    {
        #region Operations

        public bool ManageLecture(LectureDE Lecture, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageLecture";
                cmd.Parameters.AddWithValue("@id", Lecture.Id);
                cmd.Parameters.AddWithValue("@title", Lecture.Title);
                cmd.Parameters.AddWithValue("@description", Lecture.Description);
                cmd.Parameters.AddWithValue("@lectureURL", Lecture.LectureURL);
                cmd.Parameters.AddWithValue("@createdOn", Lecture.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", Lecture.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", Lecture.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", Lecture.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", Lecture.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", Lecture.DBoperation.ToString());

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
        public bool AlterLecture(LectureDE Lecture, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterLecture";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", Lecture.DBoperation.ToString());
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
        public List<LectureDE> SearchLecture(string whereClause, MySqlCommand cmd = null)
        {
            List<LectureDE> top = new List<LectureDE>();
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
                top = cmd.Connection.Query<LectureDE>("call QST.MicroERP.SearchLecture( '" + whereClause + "')").ToList();
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
