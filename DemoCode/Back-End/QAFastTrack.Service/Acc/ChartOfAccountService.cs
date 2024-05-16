using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities.Acc;
using Restaurant.DAL.Acc;
using System.Data;
using K4os.Hash.xxHash;
using Restaurant.Core.Constants;

namespace Restaurant.Service.Acc
{
    public partial class AccService
    {
        #region  ChartOfAccount

        public ChartOfAccountDE ManageChartOfAccount ( ChartOfAccountDE mod )
        {
            bool closeConnectionFlag = false;
            try
            {
                _entity = TableNames.Acc_ChartOfAccount.ToString ();
                if (cmd == null || cmd.Connection.State != ConnectionState.Open)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if(mod.DBoperation==DBoperations.Insert)
                    mod.Id =_coreDAL.GetnextId (_entity);

                #region DuplicateEntry Validation
                var accounts = SearchChartOfAccount (new ChartOfAccountDE
                {
                    CoaCode = mod.CoaCode
                });
                if (mod.DBoperation == DBoperations.Update)
                    accounts = accounts.Where (x => x.Id != mod.Id).ToList ();
                if (accounts != null && accounts.Count > 0)
                {
                    mod.AddErrorMessage (" CoaCode ' "+mod.CoaCode +" ' already Defined");
                    return mod;
                }
                #endregion

                if (_accDAL.ManageChartOfAccount (mod, cmd))
                {
                    mod.AddSuccessMessage (string.Format (AppConstants.CRUD_DB_OPERATION, _entity, mod.DBoperation.ToString ()));
                    _logger.Info ($"Success: " + string.Format (AppConstants.CRUD_DB_OPERATION, _entity, mod.DBoperation.ToString ()));
                }
                else
                {
                    mod.AddErrorMessage (string.Format (AppConstants.CRUD_ERROR, _entity));
                    _logger.Info ($"Error: " + string.Format (AppConstants.CRUD_ERROR, _entity));
                }
            }
            catch (Exception ex)
            {
                _logger.Error (ex);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
            return mod;
        }
        public List<ChartOfAccountDE> SearchChartOfAccount ( ChartOfAccountDE mod )
        {
            List<ChartOfAccountDE> accounts = new List<ChartOfAccountDE> ();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null || cmd.Connection.State != ConnectionState.Open)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                #region Search

                string whereClause = " Where 1=1";

                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND acc.Id={mod.Id}";
                if (mod.CoaLevelId != default && mod.CoaLevelId != 0)
                    whereClause += $" AND acc.CoaLevelId={mod.CoaLevelId}";
                if (mod.ParentCoaId != default && mod.ParentCoaId != 0)
                    whereClause += $" AND acc.ParentCoaId={mod.ParentCoaId}";
                if (mod.CoaLevel != default && mod.CoaLevel != "")
                    whereClause += $" AND level.Name like '" + mod.CoaLevel + "'";
                if (mod.CoaCode != default && mod.CoaCode != "")
                    whereClause += $" AND acc.CoaCode  like '" + mod.CoaCode + "'";
                if (mod.CoaDesc != default && mod.CoaDesc != "")
                    whereClause += $" AND acc.CoaDesc like '" + mod.CoaDesc + "'";
                if (mod.ParentCoaDesc != default && mod.ParentCoaDesc != "")
                    whereClause += $" AND parentAcc.CoaDesc like '" + mod.ParentCoaDesc + "'";
                if (mod.CoaTypeId != default && mod.CoaTypeId != 0)
                    whereClause += $" AND acc.CoaTypeId={mod.CoaTypeId}";
                if (mod.IsActive != default)
                    whereClause += $" AND acc.IsActive ={mod.IsActive}";
                if (mod.PageNo != default)
                    accounts = _accDAL.SearchChartOfAccount (whereClause, cmd, mod.PageNo, mod.PageSize);
                else
                    accounts = _accDAL.SearchChartOfAccount (whereClause, cmd);

                #endregion
            }
            catch (Exception exp)
            {
                _logger.Error (exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
            return accounts;
        }
        public List<ChartOfAccountDE> GetAccounts ( ChartOfAccountDE mod )
        {
            List<ChartOfAccountDE> accounts = new List<ChartOfAccountDE> ();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null || cmd.Connection.State != ConnectionState.Open)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                #region Search

                string whereClause = " Where 1=1";

                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND acc.Id={mod.Id}";
                if (mod.CoaLevelId != default && mod.CoaLevelId != 0)
                    whereClause += $" AND acc.CoaLevelId={mod.CoaLevelId}";
                if (mod.ParentCoaId != default && mod.ParentCoaId != 0)
                    whereClause += $" AND acc.ParentCoaId={mod.ParentCoaId}";
                if (mod.CoaLevel != default && mod.CoaLevel != "")
                    whereClause += $" AND level.Name like '%" + mod.CoaLevel + "%'";
                if (mod.CoaCode != default && mod.CoaCode != "")
                    whereClause += $" AND acc.CoaCode  like '%" + mod.CoaCode + "%'";
                if (mod.CoaDesc != default && mod.CoaDesc != "")
                    whereClause += $" AND acc.CoaDesc like '%" + mod.CoaDesc + "%'";
                if (mod.ParentCoaDesc != default && mod.ParentCoaDesc != "")
                    whereClause += $" AND parentAcc.CoaDesc like '%" + mod.ParentCoaDesc + "%'";
                if (mod.CoaTypeId != default && mod.CoaTypeId != 0)
                    whereClause += $" AND acc.CoaTypeId={mod.CoaTypeId}";
                if (mod.IsActive != default)
                    whereClause += $" AND acc.IsActive ={mod.IsActive}";
                if (mod.PageNo != default)
                    accounts = _accDAL.SearchChartOfAccount (whereClause, cmd, mod.PageNo, mod.PageSize);
                else
                    accounts = _accDAL.SearchChartOfAccount (whereClause, cmd);

                #endregion
            }
            catch (Exception exp)
            {
                _logger.Error (exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
            return accounts;
        }

        #endregion
    }
}
