using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class AssignClassService
    {
        #region Class Members/Class Variables

        private AssignClassDAL _assignClassDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public AssignClassService()
        {
            _assignClassDAL = new AssignClassDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region AssignClass
        public bool ManageAssignClass(AssignClassDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.assignclass.ToString());
                retVal = _assignClassDAL.ManageAssignClass(mod);
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
        public List<AssignClassDE> SearchAssignClass(AssignClassDE mod)
        {
            List<AssignClassDE> AssignClass = new List<AssignClassDE>();
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
                if (mod.StudentschoolId != default)
                    whereClause += $" AND StudentschoolId={mod.StudentschoolId}";
                if (mod.Student != default)
                    whereClause += $" and Student like ''" + mod.Student + "''";
                if (mod.Dateofassignment != default)
                    whereClause += $" and Dateofassignment like ''" + mod.Dateofassignment + "''";
                if (mod.Effectivedate != default)
                    whereClause += $" and Effectivedate like ''" + mod.Effectivedate + "''";
                if (mod.ClassId != default)
                    whereClause += $" AND ClassId={mod.ClassId}";
                if (mod.SectionId != default)
                    whereClause += $" AND SectionId={mod.SectionId}";
                if (mod.BranchId != default)
                    whereClause += $" AND BranchId={mod.BranchId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                AssignClass = _assignClassDAL.SearchAssignClass(whereClause);

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
            return AssignClass;
        }
        #endregion
    }
}
