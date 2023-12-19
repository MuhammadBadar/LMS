using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class BranchschoolService
    {
        #region Class Members/Class Variables

        private BranchschoolDAL _branchschoolDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public BranchschoolService()
        {
            _branchschoolDAL = new BranchschoolDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Branch
        public bool ManageBranchschool(BranchschoolDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.branchschool.ToString());
                retVal = _branchschoolDAL.ManageBranchschool(mod);
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
        public List<BranchschoolDE> SearchBranchschool(BranchschoolDE mod)
        {
            List<BranchschoolDE> Branchschool = new List<BranchschoolDE>();
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
                if (mod.SchoolId != default && mod.SchoolId != 0)
                    whereClause += $" AND Id={mod.SchoolId}";
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
                Branchschool = _branchschoolDAL.SearchBranchschool(whereClause);

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
            return Branchschool;
        }
        #endregion
    }
}
