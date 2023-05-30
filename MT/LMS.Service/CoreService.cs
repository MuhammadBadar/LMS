using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;

namespace LMS.Services
{
    public class CoreService
    {
        #region Class Variables
        private CoreDAL _corDAL;
        #endregion
        #region Constructors
        public CoreService()
        {
            _corDAL = new CoreDAL();
        }
        #endregion
        #region Enums
        public List<EnumValueDE> GetEnumValues(EnumType type)
        {
            return _corDAL.GetEnumValues(type);
        }
        public bool ManageEnumValue(EnumValueDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                _corDAL.ManageEnumValue(mod);
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
        #endregion
    }
}
