using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class FeeDAL
    {
        #region Operations
        public bool ManageFee(FeeDE _fee, MySqlCommand cmd = null)
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
                cmd.Parameters.Clear();

                cmd.CommandText = "ManageFee";
                cmd.Parameters.AddWithValue("@id", _fee.Id);                
                cmd.Parameters.AddWithValue("@studentId", _fee.StudentId);
                cmd.Parameters.AddWithValue("@feeDate", _fee.FeeDate);
                cmd.Parameters.AddWithValue("@amount", _fee.Amount);
                cmd.Parameters.AddWithValue("@netAmount", _fee.NetAmount);
                cmd.Parameters.AddWithValue("@concession", _fee.Concession);                
                cmd.Parameters.AddWithValue("@createdOn", _fee.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _fee.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _fee.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _fee.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _fee.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _fee.DBoperation.ToString());

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
        public List<FeeDE> SearchFee(string whereClause, MySqlCommand cmd = null)
        {
            List<FeeDE> top = new List<FeeDE>();
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
                top = cmd.Connection.Query<FeeDE>("call lms.SearchFee( '" + whereClause + "')").ToList();
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
