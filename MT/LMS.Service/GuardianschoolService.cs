using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class GuardianschoolService
    {
        #region Class Members/Class Variables

        private GuardianschoolDAL _guardianschoolDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public GuardianschoolService()
        {
            _guardianschoolDAL = new GuardianschoolDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Guardian
        public bool ManageGuardianschool(GuardianschoolDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.guardianschool.ToString());
                retVal = _guardianschoolDAL.ManageGuardianschool(mod);
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
        public List<GuardianschoolDE> SearchGuardianschool(GuardianschoolDE mod)
        {
            List<GuardianschoolDE> Guardianschool = new List<GuardianschoolDE>();
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
                if (mod.Cnic != default)
                    whereClause += $" and Cnic like ''" + mod.Cnic + "''";
                if (mod.Address != default)
                    whereClause += $" and Address like ''" + mod.Address + "''";
                if (mod.Cell1 != default)
                    whereClause += $" and Cell1 like ''" + mod.Cell1 + "''";
                if (mod.Cell2 != default)
                    whereClause += $" and Cell2 like ''" + mod.Cell2 + "''";
                if (mod.Cell3 != default)
                    whereClause += $" and Cell3 like ''" + mod.Cell3 + "''";
                if (mod.Email != default)
                    whereClause += $" and Email like ''" + mod.Email + "''";
                if (mod.Whatsapp != default)
                    whereClause += $" and Whatsapp like ''" + mod.Whatsapp + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Guardianschool = _guardianschoolDAL.SearchGuardianschool(whereClause);

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
            return Guardianschool;
        }
        #endregion
    }
}
