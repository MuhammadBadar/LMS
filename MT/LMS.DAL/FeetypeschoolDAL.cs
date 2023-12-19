using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class FeetypeschoolDAL
    {
        #region Operations
        public bool ManageFeetypeschool(FeetypeschoolDE _feetypeschool, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageFeetypeschool";
                cmd.Parameters.AddWithValue("@id", _feetypeschool.Id);
                cmd.Parameters.AddWithValue("@title", _feetypeschool.Title);
                cmd.Parameters.AddWithValue("@type", _feetypeschool.Type);
                cmd.Parameters.AddWithValue("@isRefundable", _feetypeschool.IsRefundable);
                cmd.Parameters.AddWithValue("@createdOn", _feetypeschool.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _feetypeschool.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _feetypeschool.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _feetypeschool.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _feetypeschool.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _feetypeschool.DBoperation.ToString());

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
        public List<FeetypeschoolDE> SearchFeetypeschool(string whereClause, MySqlCommand cmd = null)
        {
            List<FeetypeschoolDE> top = new List<FeetypeschoolDE>();
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
                top = cmd.Connection.Query<FeetypeschoolDE>("call lms.SearchFeetypeschool( '" + whereClause + "')").ToList();
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
