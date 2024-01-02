using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;

namespace LMS.DAL
{
    public class FeeLineDAL
    {
        #region Operations

        public bool ManageFeeLine(FeeLineDE _feeLine, MySqlCommand cmd = null)
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
                    Console.WriteLine("Connection has been created");
                else
                    Console.WriteLine("Connection error");

                // Clear existing parameters
                cmd.Parameters.Clear();

                // Add new parameters
                cmd.CommandText = "ManageFeeLine";
                cmd.Parameters.AddWithValue("@id", _feeLine.Id);
                cmd.Parameters.AddWithValue("@feeId", _feeLine.FeeId);
                cmd.Parameters.AddWithValue("@feeTypeId", _feeLine.FeeTypeId);
                cmd.Parameters.AddWithValue("@feeAmount", _feeLine.FeeAmount);
                cmd.Parameters.AddWithValue("@concession", _feeLine.Concession);
                cmd.Parameters.AddWithValue("@createdOn", _feeLine.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _feeLine.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _feeLine.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _feeLine.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _feeLine.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _feeLine.DBoperation.ToString());

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

        public List<FeeLineDE> SearchFeeLine(string whereClause, MySqlCommand cmd = null)
        {
            List<FeeLineDE> top = new List<FeeLineDE>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection has been created");
                else
                    Console.WriteLine("Connection error");

                top = cmd.Connection.Query<FeeLineDE>("call lms.SearchFeeLine( '" + whereClause + "')").ToList();
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
