using LMS.Core.Entities;
using LMS.Core.Entities.Security;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Service
{
    public class CityStudentService
    {
        private CityStudentDAL _ctystdDAL;
        private CoreDAL _corDAL;
        private Logger _logger;


        public CityStudentService()
        {
            _ctystdDAL = new CityStudentDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }

        #region  CityStudent
        public bool ManageCityStudent(CityStudentDE _ctystd)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_ctystd.DBoperation == DBoperations.Insert)
                    _ctystd.Id = _corDAL.GetnextId(TableNames.CityStudent.ToString());
                retVal = _ctystdDAL.ManageCityStudent(_ctystd, cmd);
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
        public List<CityStudentDE> SearchCityStudent(CityStudentDE _ctystd)
        {
            List<CityStudentDE> retVal = new List<CityStudentDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                string WhereClause = " Where 1=1";
                if (_ctystd.Id != default)
                    WhereClause += $" AND Id={_ctystd.Id}";
                if (_ctystd.StudentId != default)
                    WhereClause += $" AND StudentId={_ctystd.StudentId}";
                if (_ctystd.CityId != default)
                    WhereClause += $" AND CityId={_ctystd.CityId}";
                //if (_ctystd.IsActive != default)
                //    WhereClause += $" AND IsActive={_ctystd.IsActive}";
                //if (_ctystd.IsActive != default && _ctystd.IsActive == true)
                //    WhereClause += $" AND IsActive=1";
                //else
                //    WhereClause += $" AND IsActive=0";
                if (_ctystd.IsActive != default && _ctystd.IsActive == true)
                    WhereClause += $" AND IsActive=0";
                else
                    WhereClause += $" AND IsActive=1";

                retVal = _ctystdDAL.SearchCityStudent(WhereClause, cmd);
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
