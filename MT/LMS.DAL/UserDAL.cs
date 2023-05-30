using Dapper;
using LMS.Core.Entities;
using LMS.WebAPI.Models;
using MySql.Data.MySqlClient;
using System.Data;


namespace LMS.DAL
{
    public class UserDAL
    {
        #region Properties
        public bool ManageUser(UserDE _user, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageUser";
                cmd.Parameters.AddWithValue("@id", _user.Id);
                cmd.Parameters.AddWithValue("@email", _user.Email);
                cmd.Parameters.AddWithValue("@password", _user.Password);
                cmd.Parameters.AddWithValue("@rememberMe", _user.RememberMe);
                cmd.Parameters.AddWithValue("@createdOn", _user.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _user.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _user.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _user.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _user.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _user.DBoperation.ToString());

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
        public List<UserDE> SearchUser(string whereClause, MySqlCommand? cmd )
        {
            List<UserDE> top = new List<UserDE>();
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
                top = cmd.Connection.Query<UserDE>("call lms.SearchUser( '" + whereClause + "')").ToList();
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
