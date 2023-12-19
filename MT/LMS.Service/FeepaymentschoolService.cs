using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class FeepaymentschoolService
    {
        #region Class Members/Class Variables

        private FeepaymentschoolDAL _feepaymentschoolDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public FeepaymentschoolService()
        {
            _feepaymentschoolDAL = new FeepaymentschoolDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region FeeType
        public bool ManageFeepaymentschool(FeepaymentschoolDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.feepaymentschool.ToString());
                retVal = _feepaymentschoolDAL.ManageFeepaymentschool(mod);
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
        public List<FeepaymentschoolDE> SearchFeepaymentschool(FeepaymentschoolDE mod)
        {
            List<FeepaymentschoolDE> Feepaymentschool = new List<FeepaymentschoolDE>();
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
                if (mod.RegNo != default)
                    whereClause += $" and RegNo like ''" + mod.RegNo + "''";
                if (mod.Student != default)
                    whereClause += $" and Student like ''" + mod.Student + "''";
                if (mod.StudentschoolId != default)
                    whereClause += $" and StudentschoolId like ''" + mod.StudentschoolId + "''";
                if (mod.ClassId != default)
                    whereClause += $" and ClassId like ''" + mod.ClassId + "''";
                if (mod.Branch != default)
                    whereClause += $" and Branch like ''" + mod.Branch + "''";
                if (mod.Class != default)
                    whereClause += $" and Class like ''" + mod.Class + "''";
                if (mod.ContactNo != default)
                    whereClause += $" and ContactNo like ''" + mod.ContactNo + "''";
                if (mod.Amount != default)
                    whereClause += $" and Amount like ''" + mod.Amount + "''";
                if (mod.Concession != default)
                    whereClause += $" and Concession like ''" + mod.Concession + "''";
                if (mod.PayableAmount != default)
                    whereClause += $" and PayableAmount like ''" + mod.PayableAmount + "''";
                if (mod.SectionId != default)
                    whereClause += $" and SectionId like ''" + mod.SectionId + "''";
                if (mod.FeetypeschoolId != default)
                    whereClause += $" and FeetypeschoolId like ''" + mod.FeetypeschoolId + "''";
                if (mod.Feetype != default)
                    whereClause += $" and Feetype like ''" + mod.Feetype + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Feepaymentschool = _feepaymentschoolDAL.SearchFeepaymentschool(whereClause);

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
            return Feepaymentschool;
        }
        #endregion
    }
}
