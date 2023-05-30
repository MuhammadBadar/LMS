using LMS.Core.Entities.Security;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;

namespace LMS.Services
{
    public class FeatureService
    {
        #region Class Members/Class Variables

        private FeatureDAL _featDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public FeatureService()
        {
            _featDAL = new FeatureDAL();
            _corDAL = new CoreDAL();
        }


        #endregion
        #region Feature
        public bool ManagementFeature(FeatureDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool retVal = true;
                cmd = LMSDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.feature.ToString());
                retVal = _featDAL.ManageFeature(mod);
                if (retVal == true)
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
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<FeatureDE> SearchFeatures(FeatureDE mod)
        {
            List<FeatureDE> Feature = new List<FeatureDE>();
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
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Feature = _featDAL.SearchFeatures(whereClause);

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
            return Feature;
        }

        #endregion
    }
}
