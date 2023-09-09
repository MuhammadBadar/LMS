using Dapper;
using MySql.Data.MySqlClient;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.DAL
{
    public class ExpenseDAL
    {
        #region Operations

        public bool ManageExpense(ExpenseDE exp, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageExpense";
                cmd.Parameters.AddWithValue("@id", exp.Id);
                cmd.Parameters.AddWithValue("@expenseDate", exp.ExpenseDate);
                cmd.Parameters.AddWithValue("@expenseTypeId", exp.ExpenseTypeId);
                cmd.Parameters.AddWithValue("@expenseTitle", exp.ExpenseTitle);
                cmd.Parameters.AddWithValue("@expenseDetail", exp.ExpenseDetail);
                cmd.Parameters.AddWithValue("@createdOn", exp.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", exp.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", exp.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", exp.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", exp.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", exp.DBoperation.ToString());

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
        public bool AlterExpense(ExpenseDE Expense, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterExpense";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", Expense.DBoperation.ToString());
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
        public List<ExpenseVM> SearchExpense(string whereClause, MySqlCommand cmd = null)
        {
            List<ExpenseVM> top = new List<ExpenseVM>();
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
                top = cmd.Connection.Query<ExpenseVM>("call QST.MicroERP.SearchExpense( '" + whereClause + "')").ToList();
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
