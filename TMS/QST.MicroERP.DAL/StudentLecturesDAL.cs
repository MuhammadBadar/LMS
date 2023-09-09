using Dapper;
using QST.MicroERP.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.DAL
{
    public class StudentLecturesDAL
    {
        #region Operations

        public bool ManageStudentLecture(StudentLecturesDE stdl, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageStudentLecture";
                cmd.Parameters.AddWithValue("@id", stdl.Id);
                cmd.Parameters.AddWithValue("@studentId", stdl.StudentId);
                cmd.Parameters.AddWithValue("@lectureId", stdl.LectureId);
                cmd.Parameters.AddWithValue("@assignedOn", stdl.AssignedOn);
                cmd.Parameters.AddWithValue("@createdOn", stdl.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", stdl.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", stdl.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", stdl.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", stdl.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", stdl.DBoperation.ToString());

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
        public bool AlterStudentLecture(StudentLecturesDE stdl, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterStudentLecture";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", stdl.DBoperation.ToString());
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
        public List<StudentLecturesDE> SearchStudentLecture(string whereClause, MySqlCommand cmd = null)
        {
            List<StudentLecturesDE> top = new List<StudentLecturesDE>();
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
                top = cmd.Connection.Query<StudentLecturesDE>("call QST.MicroERP.SearchStudentLecture( '" + whereClause + "')").ToList();
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
