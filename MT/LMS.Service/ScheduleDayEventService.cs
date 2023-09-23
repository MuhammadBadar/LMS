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
    public class ScheduleDayEventService
    {
        #region Class Variables
        private ScheduleDayEventDAL _patDAL;
        private CoreDAL _coreDAL;
        private Logger _logger;
        #endregion
        #region Constructor
        public ScheduleDayEventService()
        {
            _patDAL = new ScheduleDayEventDAL();
            _coreDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region  Patient
        public bool ManageScheduleDayEvent(ScheduleDayEventDE _pat)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_pat.DBoperation == DBoperations.Insert)
                    _pat.Id = _coreDAL.GetnextId(TableNames.ScheduleDayEvent.ToString());
                retVal = _patDAL.ManageScheduleDayEvent(_pat, cmd);
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
        public List<ScheduleDayEventDE> SearchScheduleDayEvent(ScheduleDayEventDE _pat)
        {
            List<ScheduleDayEventDE> retVal = new List<ScheduleDayEventDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                string WhereClause = " Where 1=1";
                if (_pat.Id != default)
                    WhereClause += $" AND Id={_pat.Id}";
                if (_pat.SchId != default)
                    WhereClause += $" AND SchId={_pat.SchId}";
                if (_pat.SchDayId != default)
                    WhereClause += $" AND SchDayId={_pat.SchDayId}";
                if (_pat.StartTime != default)
                    WhereClause += $" and StartTime like ''" + _pat.StartTime + "''";
                if (_pat.EndTime != default)
                    WhereClause += $" and EndTime like ''" + _pat.EndTime + "''";
                if (_pat.LocationId != default)
                    WhereClause += $" AND LocationId={_pat.LocationId}";
                if (_pat.EventTypeId != default)
                    WhereClause += $" AND EventTypeId={_pat.EventTypeId}";                                
                if (_pat.IsActive != default && _pat.IsActive == true)
                    WhereClause += $" AND IsActive=1";


                retVal = _patDAL.SearchScheduleDayEvent(WhereClause, cmd);
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
