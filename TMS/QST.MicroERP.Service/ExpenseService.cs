using MySql.Data.MySqlClient;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.ViewModel;
using QST.MicroERP.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Service
{
    public class ExpenseService
    {
        #region Class Members/Class Variables

        private ExpenseDAL _exDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public ExpenseService()
        {
            _exDAL = new ExpenseDAL();
            _corDAL = new CoreDAL();
        }


        #endregion
        #region Expense
        public bool ManagementExpense(ExpenseDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.expense.ToString());
                    check = _exDAL.ManageExpense(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _exDAL.ManageExpense(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _exDAL.AlterExpense(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _exDAL.AlterExpense(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _exDAL.AlterExpense(mod, mod.Id);
                }
                if (check == true)
                    mod.DBoperation = DBoperations.NA;


                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }


        }
        public List<ExpenseVM> SearchExpenses(ExpenseVM mod)
        {
            List<ExpenseVM> Expense = new List<ExpenseVM>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ExpenseDetail != default)
                    whereClause += $" AND ExpenseDetail like ''" + mod.ExpenseDetail + "''";
                if (mod.ExpenseTitle != default)
                    whereClause += $" AND ExpenseTitle like ''" + mod.ExpenseTitle + "''";
                if (mod.ExpenseTypeId != default)
                    whereClause += $" AND ExpenseTypeId={mod.ExpenseTypeId}";
                if (mod.ExpenseType != default)
                    whereClause += $" AND ExpenseType like ''" + mod.ExpenseType + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Expense = _exDAL.SearchExpense(whereClause);

                #endregion


            }
            catch (Exception exp)
            {

                throw exp;

            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return Expense;
        }

        #endregion
    }
}
