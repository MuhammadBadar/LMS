using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.DAL
{
    public class StudentDAL
    {

        #region Operations

        public bool ManageStudent(StudentDE std, MySqlCommand? cmd)
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
                cmd.CommandText = "Manage_Student";
                cmd.Parameters.AddWithValue("@prm_Id", std.Id);
                cmd.Parameters.AddWithValue("@prm_CityId", std.CityId);
                cmd.Parameters.AddWithValue("@prm_City", std.City);
                cmd.Parameters.AddWithValue("@prm_TopicId", std.TopicId);
                cmd.Parameters.AddWithValue("@prm_Topic", std.Topic);
                cmd.Parameters.AddWithValue("@prm_Name", std.Name);
                cmd.Parameters.AddWithValue("@prm_Email", std.Email);
                cmd.Parameters.AddWithValue("@prm_CreatedOn", std.CreatedOn);
                cmd.Parameters.AddWithValue("@prm_CreatedBy", std.CreatedById);
                cmd.Parameters.AddWithValue("@prm_ModifiedOn", std.ModifiedOn);
                cmd.Parameters.AddWithValue("@prm_ModifiedBy", std.ModifiedById);
                cmd.Parameters.AddWithValue("@prm_IsActive", std.IsActive);
                cmd.Parameters.AddWithValue("@prm_DBoperation", std.DBoperation.ToString());
                cmd.Parameters.AddWithValue("@prm_Filter", std.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public bool AlterStudent(StudentDE std, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterStudent";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", std.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
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
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                top = cmd.Connection.Query<StudentDE>("call lms.SearchStudent( '" + whereClause + "')").ToList();
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
