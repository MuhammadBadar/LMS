using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class PatientService
    {
        #region Class Variables
        private PatientDAL _patDAL;
        private CoreDAL _coreDAL;
        private Logger _logger;
        #endregion
        #region Constructor
        public PatientService()
        {
            _patDAL = new PatientDAL();
            _coreDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region  Patient
        public bool ManagePatient(PatientDE _pat)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_pat.DBoperation == DBoperations.Insert)
                    _pat.Id = _coreDAL.GetnextId(TableNames.patient.ToString());
                retVal = _patDAL.ManagePatient(_pat, cmd);
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<PatientDE> SearchPatient(PatientDE _pat)
        {
            List<PatientDE> retVal = new List<PatientDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                string WhereClause = " Where 1=1";
                if (_pat.Id != default)
                    WhereClause += $" AND Id={_pat.Id}";
                if (_pat.PatientName != default)
                    WhereClause += $" and PatientName like ''" + _pat.PatientName + "''";
                if (_pat.DateOfBirth != default)
                    WhereClause += $" and DateOfBirth like ''" + _pat.DateOfBirth + "''";
                if (_pat.Gender != default)
                    WhereClause += $" and Gender like ''" + _pat.Gender + "''";
                if (_pat.ContactNo != default)
                    WhereClause += $" and ContactNo like ''" + _pat.ContactNo + "''";
                if (_pat.HouseNo != default)
                    WhereClause += $" and HouseNo like ''" + _pat.HouseNo + "''";
                if (_pat.Address != default)
                    WhereClause += $" and Address like ''" + _pat.Address + "''";
                if (_pat.Remarks != default)
                    WhereClause += $" and Remarks like ''" + _pat.Remarks + "''";
                if (_pat.IsActive != default && _pat.IsActive == true)
                    WhereClause += $" AND IsActive=1";


                retVal = _patDAL.SearchPatient(WhereClause, cmd);
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        #endregion
    }
}
