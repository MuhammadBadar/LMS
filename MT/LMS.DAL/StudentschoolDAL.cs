using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class StudentschoolDAL
    {
        #region Operations
        public bool ManageStudentschool(StudentschoolDE _studentschool, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageStudentschool";
                cmd.Parameters.AddWithValue("@id", _studentschool.Id);
                cmd.Parameters.AddWithValue("@guardianschoolId", _studentschool.GuardianschoolId);
                cmd.Parameters.AddWithValue("@name", _studentschool.Name);
                cmd.Parameters.AddWithValue("@admissionDate", _studentschool.AdmissionDate);
                cmd.Parameters.AddWithValue("@leftDate", _studentschool.LeftDate);
                cmd.Parameters.AddWithValue("@gender", _studentschool.Gender);
                cmd.Parameters.AddWithValue("@dateofbirth", _studentschool.Dateofbirth);
                cmd.Parameters.AddWithValue("@createdOn", _studentschool.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _studentschool.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _studentschool.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _studentschool.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _studentschool.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _studentschool.DBoperation.ToString());

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
        public List<StudentschoolDE> SearchStudentschool(string whereClause, MySqlCommand cmd = null)
        {
            List<StudentschoolDE> top = new List<StudentschoolDE>();
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
                top = cmd.Connection.Query<StudentschoolDE>("call lms.SearchStudentschool( '" + whereClause + "')").ToList();
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
