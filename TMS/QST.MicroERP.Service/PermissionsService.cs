using QST.MicroERP.Core.Entities.Security;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
using QST.MicroERP.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Services
{
    public class PermissionsService
    {

        #region Class Members/Class Variables

        private PermissionsDAL _permsDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public PermissionsService()
        {
            _permsDAL = new PermissionsDAL();
            _corDAL = new CoreDAL();
        }

        #endregion
        #region ResourcePermission
        public bool ManagementPermissions(PermissionDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
               

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.permissions.ToString());
                    check = _permsDAL.ManagePermission(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _permsDAL.ManagePermission(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _permsDAL.AlterPermission(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _permsDAL.AlterPermission(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _permsDAL.AlterPermission(mod, mod.Id);
                }
                if (check == true)
                    mod.DBoperation = DBoperations.NA;

                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
          
           

        }
        public List<PermissionDE> SearchPermissions(PermissionsSearchCriteria mod)
        {
            List<PermissionDE> ResourcePermission = new List<PermissionDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.UserId != default)
                    whereClause += $" AND UserId like ''" + mod.UserId + "''";
                if (mod.RoleId != default)
                    whereClause += $" AND RoleId like ''" + mod.RoleId + "''";
                if (mod.PermissionValue != default)
                    whereClause += $" AND PermissionValue={mod.PermissionValue}";
                if (mod.FeatureId != default)
                    whereClause += $" AND FeatureId ={mod.FeatureId}";
                if (mod.IsActive != default)
                    if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                ResourcePermission = _permsDAL.SearchPermissions(whereClause);

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
            return ResourcePermission;
        }

        #endregion

    }
}
