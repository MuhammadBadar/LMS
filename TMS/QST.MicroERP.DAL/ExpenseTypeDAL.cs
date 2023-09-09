using Dapper;
using MySql.Data.MySqlClient;
using QST.MicroERP.Core.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.DAL
{
    public class ExpenseTypeDAL
    {
        #region Operations

        public bool ManageExpenseType(ExpenseTypeDE ExpenseType, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "ManageExpenseType";
                cmd.Parameters.AddWithValue("@id", ExpenseType.Id);
                cmd.Parameters.AddWithValue("@type", ExpenseType.Type);
                cmd.Parameters.AddWithValue("@comment", ExpenseType.Comment);
                cmd.Parameters.AddWithValue("@createdOn", ExpenseType.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", ExpenseType.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", ExpenseType.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", ExpenseType.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", ExpenseType.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", ExpenseType.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        public bool AlterExpenseType(ExpenseTypeDE ExpenseType, int? Id = null, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "AlterExpenseType";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", ExpenseType.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception exp)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<ExpenseTypeDE> SearchExpenseType(string whereClause, MySqlCommand cmd = null)
        {
            List<ExpenseTypeDE> top = new List<ExpenseTypeDE>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                top = cmd.Connection.Query<ExpenseTypeDE>("call QST.MicroERP.SearchExpenseType( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception exp)
            {

                return top;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }

        #endregion
    }
}
