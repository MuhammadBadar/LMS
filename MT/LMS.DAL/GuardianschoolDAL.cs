using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class GuardianschoolDAL
    {
        #region Operations
        public bool ManageGuardianschool(GuardianschoolDE _guardianschool, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageGuardianschool";
                cmd.Parameters.AddWithValue("@id", _guardianschool.Id);
                cmd.Parameters.AddWithValue("@name", _guardianschool.Name);
                cmd.Parameters.AddWithValue("@cnic", _guardianschool.Cnic);
                cmd.Parameters.AddWithValue("@address", _guardianschool.Address);
                cmd.Parameters.AddWithValue("@cell1", _guardianschool.Cell1);
                cmd.Parameters.AddWithValue("@cell2", _guardianschool.Cell2);
                cmd.Parameters.AddWithValue("@cell3", _guardianschool.Cell3);
                cmd.Parameters.AddWithValue("@email", _guardianschool.Email);
                cmd.Parameters.AddWithValue("@whatsapp", _guardianschool.Whatsapp);
                cmd.Parameters.AddWithValue("@createdOn", _guardianschool.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _guardianschool.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _guardianschool.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _guardianschool.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _guardianschool.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _guardianschool.DBoperation.ToString());

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
        public List<GuardianschoolDE> SearchGuardianschool(string whereClause, MySqlCommand cmd = null)
        {
            List<GuardianschoolDE> top = new List<GuardianschoolDE>();
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
                top = cmd.Connection.Query<GuardianschoolDE>("call lms.SearchGuardianschool( '" + whereClause + "')").ToList();
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
