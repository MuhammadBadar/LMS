using LMS.Core.Entities.Security;
using LMS.Core.Enums;
using LMS.Core.SearchCriteria;
using LMS.DAL;
using MySql.Data.MySqlClient;

namespace LMS.Services
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
        public bool ManagementPermissions(List<PermissionDE> permission)
        {
            MySqlCommand cmd = null;
            try
            {
                bool retVal = true;
                cmd = LMSDataContext.OpenMySqlConnection();
                foreach (var mod in permission)
                {
                    if (mod.DBoperation == DBoperations.Insert)
                        mod.Id = _corDAL.GetnextId(TableNames.permissions.ToString());
                    retVal = _permsDAL.ManagePermission(mod);
                    if (retVal == true)
                        mod.DBoperation = DBoperations.NA;
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (cmd != null)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<PermissionDE> SearchPermissions(PermissionsSearchCriteria mod)
        {
            List<PermissionDE> ResourcePermission = new List<PermissionDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
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
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return ResourcePermission;
        }
        #endregion
    }
}
