using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class SchoolService
    {
        #region Class Members/Class Variables

        private SchoolDAL _schoolDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public SchoolService()
        {
            _schoolDAL = new SchoolDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region School
        public bool ManageSchool(SchoolDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.school.ToString());
                retVal = _schoolDAL.ManageSchool(mod);
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
        public List<SchoolDE> SearchSchool(SchoolDE mod)
        {
            List<SchoolDE> School = new List<SchoolDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.Name != default)
                    whereClause += $" and Name like ''" + mod.Name + "''";
                if (mod.Address != default)
                    whereClause += $" and Address like ''" + mod.Address + "''";
                if (mod.ContactPerson != default)
                    whereClause += $" and ContactPerson like ''" + mod.ContactPerson + "''";
                if (mod.CellNo != default)
                    whereClause += $" and CellNo like ''" + mod.CellNo + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                School = _schoolDAL.SearchSchool(whereClause);

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
            return School;
        }
        #endregion
    }
}
