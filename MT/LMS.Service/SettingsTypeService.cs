using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class SettingsTypeService
    {
        #region Class Members/Class Variables

        private SettingsTypeDAL _settingsTypeDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public SettingsTypeService()
        {
            _settingsTypeDAL = new SettingsTypeDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region SettingsType
        public bool ManagementSettingsType(SettingsTypeDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.enums.ToString());
                if (mod.Id == 1)
                    mod.Id = 1001;
                retVal = _settingsTypeDAL.ManageSettingsType(mod);
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (cmd != null)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<SettingsTypeDE> SearchSettingsTypes(SettingsTypeDE mod)
        {
            List<SettingsTypeDE> SettingsTypes = new List<SettingsTypeDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.ParentId != default && mod.ParentId != 0)
                    whereClause += $" AND ParentId={mod.ParentId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                if (mod.IstAccountLevel != default)
                    whereClause += $" AND IstAccountLevel ={mod.IstAccountLevel}";
                SettingsTypes = _settingsTypeDAL.SearchSettingsTypes(whereClause);

                #endregion
            }
            catch (Exception exp)
            {
                _logger.Error(exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return SettingsTypes;
        }
        #endregion
    }
}
