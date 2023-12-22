using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class FeeLineService
    {
        #region Class Members/Class Variables

        private FeeLineDAL _feeLineDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public FeeLineService()
        {
            _feeLineDAL = new FeeLineDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region FeeLine
        public bool ManageFeeLine(FeeLineDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.feeline.ToString());
                retVal = _feeLineDAL.ManageFeeLine(mod);
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
        public List<FeeLineDE> SearchFeeLine(FeeLineDE mod)
        {
            List<FeeLineDE> FeeLine = new List<FeeLineDE>();
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
                if (mod.FeeId != default)
                    whereClause += $" and FeeId like ''" + mod.FeeId + "''";
                if (mod.FeeTypeId != default)
                    whereClause += $" and FeeTypeId like ''" + mod.FeeTypeId + "''";
                if (mod.FeeAmount != default)
                    whereClause += $" and FeeAmount like ''" + mod.FeeAmount + "''";
                if (mod.Concession != default)
                    whereClause += $" and Concession like ''" + mod.Concession + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                FeeLine = _feeLineDAL.SearchFeeLine(whereClause);

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
            return FeeLine;
        }
        #endregion


        #region GetFeeByStudentId

        #endregion
    }
}
