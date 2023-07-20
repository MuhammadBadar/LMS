using LMS.Core.Entities;
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
    public class ScheduleFHService
    {
        private ScheduleFHDAL _schDAL;
        private CoreDAL _corDAL;
        private Logger _logger;


        public ScheduleFHService()
        {
            _schDAL = new ScheduleFHDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }

        public bool ManageScheduleFH(ScheduleFHDE _Sch)
        {
            // class veriables/datamembers

            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_Sch.DBoperation == DBoperations.Insert)
                    _Sch.Id = _corDAL.GetnextId(TableNames.ScheduleFH.ToString());
                retVal = _schDAL.ManageScheduleFH(_Sch, cmd);
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

        //public List<VocabularyDE> SearchVocabulary(VocabularySearchCriteria mod)
        public List<ScheduleFHDE> SearchScheduleFH(ScheduleFHDE _sch)
        {
            // public List<TopicDE> SearchTopic(TopicDE _topic)
            {
                List<ScheduleFHDE> retVal = new List<ScheduleFHDE>();
                bool closeConnectionFlag = false;
                MySqlCommand? cmd = null;
                try
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                    string WhereClause = "Where 1=1";
                    if (_sch.Id != default)
                        WhereClause += $" AND Id={_sch.Id}";
                    if (_sch.UserId != default && _sch.UserId != 0)
                        WhereClause += $" AND UserId={_sch.UserId}";
                    if (_sch.User != default)
                        WhereClause += $" and User like ''" + _sch.User + "''";
                    if (_sch.RoleId != default && _sch.RoleId != 0)
                        WhereClause += $" AND RoleId={_sch.RoleId}";
                    if (_sch.ScheduleType != default)
                        WhereClause += $" and ScheduleType like ''" + _sch.ScheduleType + "''";
                    if (_sch.WorkingFor != default)
                        WhereClause += $" and WorkingFor like ''" + _sch.WorkingFor + "''";
                    if (_sch.WorkingHours != default)
                        WhereClause += $" and WorkingHours like ''" + _sch.WorkingHours + "''";
                    if (_sch.IsActive != default)
                        WhereClause += $" AND IsActive={_sch.IsActive}";

                    retVal = _schDAL.SearchScheduleFH(WhereClause, cmd);
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

        }
    }
}


