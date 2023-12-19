using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class StudentschoolService
    {
        #region Class Members/Class Variables

        private StudentschoolDAL _studentschoolDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public StudentschoolService()
        {
            _studentschoolDAL = new StudentschoolDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Student
        public bool ManageStudentschool(StudentschoolDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.studentschool.ToString());
                retVal = _studentschoolDAL.ManageStudentschool(mod);
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
        public List<StudentschoolDE> SearchStudentschool(StudentschoolDE mod)
        {
            List<StudentschoolDE> Studentschool = new List<StudentschoolDE>();
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
                if (mod.GuardianschoolId != default && mod.GuardianschoolId != 0)
                    whereClause += $" AND Id={mod.GuardianschoolId}";
                if (mod.Name != default)
                    whereClause += $" and Name like ''" + mod.Name + "''";
                if (mod.AdmissionDate != default)
                    whereClause += $" and AdmissionDate like ''" + mod.AdmissionDate + "''";
                if (mod.LeftDate != default)
                    whereClause += $" and LeftDate like ''" + mod.LeftDate + "''";
                if (mod.Gender != default)
                    whereClause += $" and Gender like ''" + mod.Gender + "''";
                if (mod.Dateofbirth != default)
                    whereClause += $" and Dateofbirth like ''" + mod.Dateofbirth + "''";
                whereClause += $" AND IsActive ={mod.IsActive}";
                Studentschool = _studentschoolDAL.SearchStudentschool(whereClause);

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
            return Studentschool;
        }
        #endregion
    }
}
