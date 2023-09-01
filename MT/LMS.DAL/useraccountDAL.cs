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
    public class useraccountDAL
    {
        #region DbOperations
        public bool ManageUserAccount(useraccountDE _pat, MySqlCommand? cmd)
        {
            bool closeConnection = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                cmd.CommandText = "ManageUserAccount";
                cmd.Parameters.AddWithValue("id", _pat.Id);
                cmd.Parameters.AddWithValue("userName", _pat.UserName);
                cmd.Parameters.AddWithValue("cell", _pat.Cell);
                cmd.Parameters.AddWithValue("email", _pat.Email);
                cmd.Parameters.AddWithValue("password", _pat.Password);
                cmd.Parameters.AddWithValue("retypePassword", _pat.RetypePassword);
                cmd.Parameters.AddWithValue("createdOn", _pat.CreatedOn);
                cmd.Parameters.AddWithValue("createdById", _pat.CreatedById);
                cmd.Parameters.AddWithValue("modifiedOn", _pat.ModifiedOn);
                cmd.Parameters.AddWithValue("modifiedById", _pat.ModifiedById);
                cmd.Parameters.AddWithValue("isActive", _pat.IsActive);
                cmd.Parameters.AddWithValue("DbOperation", _pat.DBoperation.ToString());
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
        public List<useraccountDE> SearchUserAccount(string WhereClause, MySqlCommand cmd)
        {
            bool closeConnection = false;
            //WhereClause = string.Empty;
            List<useraccountDE> pat = new List<useraccountDE>();
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                pat = cmd.Connection.Query<useraccountDE>("call lms.SearchUserAccount('" + WhereClause + "')").ToList();
                return pat;
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
