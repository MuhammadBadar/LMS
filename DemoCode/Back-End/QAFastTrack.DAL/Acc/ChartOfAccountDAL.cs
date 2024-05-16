using Dapper;
using Restaurant.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.Core.Entities.Acc;
using Restaurant.Core.Constants;
using Restaurant.Core.Enums;
using System.Drawing.Printing;
using System.Drawing;
using System.Data;

namespace Restaurant.DAL.Acc
{
    public partial class AccountDAL : IAccDAL
    {
        #region DbOperations

        public bool ManageChartOfAccount ( ChartOfAccountDE mod, MySqlCommand? cmd)
        {
            bool closeConnection = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnection = true;
                }
                cmd.CommandText = SPNames.ACC_Manage_ChartOfAccount;
                cmd.Parameters.AddWithValue ("prm_id", mod.Id);
                cmd.Parameters.AddWithValue ("prm_coaCode", mod.CoaCode);
                cmd.Parameters.AddWithValue ("prm_coaLevelId", mod.CoaLevelId);
                cmd.Parameters.AddWithValue ("prm_parentCoaId", mod.ParentCoaId);
                cmd.Parameters.AddWithValue ("prm_coaTypeId", mod.CoaTypeId);
                cmd.Parameters.AddWithValue ("prm_coaDesc", mod.CoaDesc);
                cmd.Parameters.AddWithValue ("prm_createdOn", mod.CreatedOn);
                cmd.Parameters.AddWithValue ("prm_createdById", mod.CreatedById);
                cmd.Parameters.AddWithValue ("prm_modifiedOn", mod.ModifiedOn);
                cmd.Parameters.AddWithValue ("prm_modifiedById", mod.ModifiedById);
                cmd.Parameters.AddWithValue ("prm_isActive", mod.IsActive);
                cmd.Parameters.AddWithValue ("prm_dbOperation", mod.DBoperation.ToString ());
                cmd.ExecuteNonQuery ();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Parameters.Clear ();
                if (closeConnection)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }
        public List<ChartOfAccountDE> SearchChartOfAccount ( string WhereClause, MySqlCommand? cmd, int PageNo = 1, int PageSize = AppConstants.GRID_MAX_PAGE_SIZE )
       {
            bool closeConnection = false;
            List<ChartOfAccountDE> acc = new List<ChartOfAccountDE> ();
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnection = true;
                }
                var parameters = new
                {
                    prm_WhereClause =WhereClause
                ,
                    prm_Start = PageNo
                ,
                    prm_Limit =PageSize
                ,
                };
                acc = cmd.Connection.Query<ChartOfAccountDE> (SPNames.ACC_Search_ChartOfAccount.ToString (), parameters, commandType: CommandType.StoredProcedure).ToList ();
                return acc;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnection)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }

        #endregion
    }
}
