using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class FeepaymentschoolDAL
    {
        #region Operations
        public bool ManageFeepaymentschool(FeepaymentschoolDE _feepaymentschool, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageFeepaymentschool";
                cmd.Parameters.AddWithValue("@id", _feepaymentschool.Id);
                cmd.Parameters.AddWithValue("@regNo", _feepaymentschool.RegNo);
                cmd.Parameters.AddWithValue("@student", _feepaymentschool.Student);
                cmd.Parameters.AddWithValue("@studentschoolId", _feepaymentschool.StudentschoolId);
                cmd.Parameters.AddWithValue("@classId", _feepaymentschool.ClassId);
                cmd.Parameters.AddWithValue("@branch", _feepaymentschool.Branch);
                cmd.Parameters.AddWithValue("@class", _feepaymentschool.Class);
                cmd.Parameters.AddWithValue("@contactNo", _feepaymentschool.ContactNo);
                cmd.Parameters.AddWithValue("@amount", _feepaymentschool.Amount);
                cmd.Parameters.AddWithValue("@concession", _feepaymentschool.Concession);
                cmd.Parameters.AddWithValue("@payableAmount", _feepaymentschool.PayableAmount);
                cmd.Parameters.AddWithValue("@sectionId", _feepaymentschool.SectionId);
                cmd.Parameters.AddWithValue("@feetypeschoolId", _feepaymentschool.FeetypeschoolId);
                cmd.Parameters.AddWithValue("@feetype", _feepaymentschool.Feetype);
                cmd.Parameters.AddWithValue("@createdOn", _feepaymentschool.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _feepaymentschool.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _feepaymentschool.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _feepaymentschool.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _feepaymentschool.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _feepaymentschool.DBoperation.ToString());

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
        public List<FeepaymentschoolDE> SearchFeepaymentschool(string whereClause, MySqlCommand cmd = null)
        {
            List<FeepaymentschoolDE> top = new List<FeepaymentschoolDE>();
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
                top = cmd.Connection.Query<FeepaymentschoolDE>("call lms.SearchFeepaymentschool( '" + whereClause + "')").ToList();
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
