using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class FeeService
    {
        #region Class Members/Class Variables

        private FeeDAL _feeDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public FeeService()
        {
            _feeDAL = new FeeDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Fee
        public bool ManageFee(FeeDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.fee.ToString());
                retVal = _feeDAL.ManageFee(mod);
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
        public List<FeeDE> SearchFee(FeeDE mod)
        {
            List<FeeDE> Fee = new List<FeeDE>();
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
                if (mod.StudentId != default)
                    whereClause += $" and StudentId like ''" + mod.StudentId + "''";
                if (mod.FeeDate != default)
                    whereClause += $" and FeeDate like ''" + mod.FeeDate + "''";
                if (mod.Amount != default)
                    whereClause += $" and Amount like ''" + mod.Amount + "''";
                if (mod.Concession != default)
                    whereClause += $" and Concession like ''" + mod.Concession + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Fee = _feeDAL.SearchFee(whereClause);

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
            return Fee;
        }
        #endregion
    }
}
