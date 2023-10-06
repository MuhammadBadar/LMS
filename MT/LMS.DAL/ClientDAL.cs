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
    public class ClientDAL
    {
        #region DbOperations
        public bool ManageClient(ClientDE _clt, MySqlCommand? cmd)
        {
            bool closeConnection = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                cmd.CommandText = "ManageClient";
                cmd.Parameters.AddWithValue("id", _clt.Id);
                cmd.Parameters.AddWithValue("clientName", _clt.ClientName);                
                cmd.Parameters.AddWithValue("cnic", _clt.Cnic);
                cmd.Parameters.AddWithValue("cell", _clt.Cell);
                cmd.Parameters.AddWithValue("address", _clt.Address);
                cmd.Parameters.AddWithValue("email", _clt.Email);
                cmd.Parameters.AddWithValue("joiningDate", _clt.JoiningDate);
                cmd.Parameters.AddWithValue("createdOn", _clt.CreatedOn);
                cmd.Parameters.AddWithValue("createdById", _clt.CreatedById);
                cmd.Parameters.AddWithValue("modifiedOn", _clt.ModifiedOn);
                cmd.Parameters.AddWithValue("modifiedById", _clt.ModifiedById);
                cmd.Parameters.AddWithValue("isActive", _clt.IsActive);
                cmd.Parameters.AddWithValue("DbOperation", _clt.DBoperation.ToString());
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
        public List<ClientDE> SearchClient(string WhereClause, MySqlCommand cmd)
        {
            bool closeConnection = false;
            //WhereClause = string.Empty;
            List<ClientDE> clt = new List<ClientDE>();
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                clt = cmd.Connection.Query<ClientDE>("call lms.SearchClient('" + WhereClause + "')").ToList();
                return clt;
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
