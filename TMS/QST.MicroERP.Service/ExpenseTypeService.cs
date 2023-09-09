using MySql.Data.MySqlClient;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Service
{
    public class ExpenseTypeService
    {
        #region Class Members/Class Variables

        private ExpenseTypeDAL _exTDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public ExpenseTypeService()
        {
            _exTDAL = new ExpenseTypeDAL();
            _corDAL = new CoreDAL();
        }


        #endregion
        #region ExpenseType
        public bool ManagementExpenseType(ExpenseTypeDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.expensetype.ToString());
                    check = _exTDAL.ManageExpenseType(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _exTDAL.ManageExpenseType(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _exTDAL.AlterExpenseType(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _exTDAL.AlterExpenseType(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _exTDAL.AlterExpenseType(mod, mod.Id);
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
        public List<ExpenseTypeDE> SearchExpenseTypes(ExpenseTypeDE mod)
        {
            List<ExpenseTypeDE> ExpenseType = new List<ExpenseTypeDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.Type != default)
                    whereClause += $" AND Type like ''" + mod.Type + "''";
                if (mod.Comment != default)
                    whereClause += $" AND Comment like ''" + mod.Comment + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                ExpenseType = _exTDAL.SearchExpenseType(whereClause);

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
            return ExpenseType;
        }

        #endregion
    }
}
