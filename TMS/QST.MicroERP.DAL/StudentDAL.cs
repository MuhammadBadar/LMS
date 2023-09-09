using System;
using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using QST.MicroERP.Core.Entities;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using QST.MicroERP.Core.ViewModel;

namespace QST.MicroERP.DAL
{
    public class StudentDAL
    {
        #region Operations

        public bool ManageStudent(StudentDE Student, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageStudent"; 
                cmd.Parameters.AddWithValue("@id", Student.Id);
                cmd.Parameters.AddWithValue("@studentName", Student.StudentName);
                cmd.Parameters.AddWithValue("@gender", Student.Gender);
                cmd.Parameters.AddWithValue("@cNIC", Student.CNIC);
                cmd.Parameters.AddWithValue("@dOB", Student.DOB);
                cmd.Parameters.AddWithValue("@cellNo", Student.CellNo);
                cmd.Parameters.AddWithValue("@email", Student.Email);
                cmd.Parameters.AddWithValue("@whatsApp", Student.WhatsApp);
                cmd.Parameters.AddWithValue("@guardianName", Student.GuardianName);
                cmd.Parameters.AddWithValue("@guardianCell", Student.GuardianCell);
                cmd.Parameters.AddWithValue("@guardianWhatsApp", Student.GuardianWhatsApp);
                cmd.Parameters.AddWithValue("@guardianEmail", Student.GuardianEmail);
                cmd.Parameters.AddWithValue("@guardianRelation", Student.GuardianRelation);
                cmd.Parameters.AddWithValue("@guardianOccupation", Student.GuardianOccupation);
                cmd.Parameters.AddWithValue("@remarks", Student.Remarks);
                cmd.Parameters.AddWithValue("@userName", Student.UserName);
                cmd.Parameters.AddWithValue("@password", Student.Password);
                cmd.Parameters.AddWithValue("@createdOn", Student.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", Student.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", Student.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", Student.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", Student.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", Student.DBoperation.ToString());

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
        public bool AlterStudent(StudentDE Student, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterStudent";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", Student.DBoperation.ToString());
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
        public List<StudentDE> SearchStudent(string whereClause, MySqlCommand cmd = null)
        {
            List<StudentDE> top = new List<StudentDE>();
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
                top = cmd.Connection.Query<StudentDE>("call QST.MicroERP.SearchStudent( '" + whereClause + "')").ToList();
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
