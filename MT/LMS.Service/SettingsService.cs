
using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class SettingsService
    {
        #region Class Members/Class Variables

        private SettingsDAL _settingsDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public SettingsService()
        {
            _settingsDAL = new SettingsDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Settings
        public bool ManagementSettings(SettingsDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                retVal = _settingsDAL.ManageSettings(mod);
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
        public List<SettingsDE> SearchSettingss(SettingsDE mod)
        {
            List<SettingsDE> Settingss = new List<SettingsDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.Name != default && mod.Name != "")
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.KeyCode != default && mod.KeyCode != "")
                    whereClause += $" AND KeyCode like ''" + mod.KeyCode + "''";
                if (mod.TypeKeyCode != default && mod.Name != "")
                    whereClause += $" AND TypeKeyCode like ''" + mod.TypeKeyCode + "''";
                if (mod.Level != default && mod.Level != "")
                    whereClause += $" AND Level like ''" + mod.Level + "''";
                if (mod.ParentId != default && mod.ParentId != 0)
                    whereClause += $" AND ParentId={mod.ParentId}";
                if (mod.LevelId != default && mod.LevelId != 0)
                    whereClause += $" AND LevelId={mod.LevelId}";
                if (mod.EnumTypeId != default && mod.EnumTypeId != 0)
                    whereClause += $" AND EnumTypeId={mod.EnumTypeId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Settingss = _settingsDAL.SearchSettingss(whereClause);

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
            return Settingss;
        }
        #endregion
    }
}
