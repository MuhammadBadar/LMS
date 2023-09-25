using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Service
{
    public class ScheduleService
    {

        private ScheduleDAL _schDAL;
        private CoreDAL _corDAL;
        private Logger _logger;


        public ScheduleService()
        {
            _schDAL = new ScheduleDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }

        public ScheduleDE ManageSchedule(ScheduleDE mod)
        {
            // class veriables/datamembers

            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.Schedule.ToString());
                retVal = _schDAL.ManageSchedule(mod, cmd);
                //if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                //    foreach (var day in mod.ScheduleDays
                //    {
                //        day.SchId = mod.Id;
                //        day.DBoperation = DBoperations.Insert;
                //        day.Id = _corDAL.GetMaxId(TableNames.ScheduleDaysToString());
                //        retVal = _schDAL.ManageScheduleDay(day, cmd);

                //    }
                if (mod.DayIds != null)
                {
                    int schDayId = 0;
                    if (mod.DBoperation == DBoperations.Insert)
                        schDayId = _corDAL.GetnextId(TableNames.scheduleday.ToString());

                    foreach (var day in mod.DayIds)
                    {
                        var SchLine = new ScheduleDayDE();
                        SchLine.Id = schDayId;
                        SchLine.DayId = day;
                        SchLine.SchId = mod.Id;
                        SchLine.DBoperation = DBoperations.Insert;
                        SchLine.IsActive = true;
                        retVal = _schDAL.ManageScheduleDay(SchLine, cmd);
                        schDayId += 1;
                    }
                }
                if (retVal == true)
                {
                    mod.DBoperation = DBoperations.NA;
                }
                LMSDataContext.EndTransaction(cmd);

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
                string whereClause = " Where 1=1";
                mod.ScheduleDays= _schDAL.SearchScheduleDay(whereClause += $" AND SchId={mod.Id} AND IsActive ={true}");
            }
            return mod;
        }

        //public List<VocabularyDE> SearchVocabulary(VocabularySearchCriteria mod)
        //        public List<ScheduleFHDE> SearchScheduleFH(ScheduleFHDE _sch)
        //        {
        //            // public List<TopicDE> SearchTopic(TopicDE _topic)
        //            {
        //                List<ScheduleFHDE> retVal = new List<ScheduleFHDE>();
        //                bool closeConnectionFlag = false;
        //                MySqlCommand? cmd = null;
        //                try
        //                {
        //                    cmd = LMSDataContext.OpenMySqlConnection();
        //                    closeConnectionFlag = true;
        //                    string WhereClause = "Where 1=1";
        //                    if (_sch.Id != default)
        //                        WhereClause += $" AND Id={_sch.Id}";
        //                    if (_sch.UserId != default)
        //                        WhereClause += $" and UserId like ''" + _sch.UserId + "''";
        //                    if (_sch.User != default)
        //                        WhereClause += $" and User like ''" + _sch.User + "''";
        //                    if (_sch.RoleId != default)
        //                        WhereClause += $" and RoleId like ''" + _sch.RoleId + "''";
        //                    if (_sch.Role != default)
        //                        WhereClause += $" and Role like ''" + _sch.Role + "''";
        //                    if (_sch.EntityId != default && _sch.EntityId != 0)
        //                        WhereClause += $" AND EntityId={_sch.EntityId}";
        //                    if (_sch.Entity != default)
        //                        WhereClause += $" and Entity like ''" + _sch.Entity + "''";
        //                    if (_sch.ScheduleTypeId != default && _sch.ScheduleTypeId != 0)
        //                        WhereClause += $" AND ScheduleTypeId={_sch.ScheduleTypeId}";
        //                    if (_sch.ScheduleType != default)
        //                        WhereClause += $" and ScheduleType like ''" + _sch.ScheduleType + "''";
        //                    if (_sch.WorkingTypeId != default && _sch.WorkingTypeId != 0)
        //                        WhereClause += $" AND WorkingTypeId={_sch.WorkingTypeId}";
        //                    if (_sch.WorkingType != default)
        //                        WhereClause += $" and WorkingType like ''" + _sch.WorkingType + "''";
        //                    if (_sch.WorkingHours != default)
        //                        WhereClause += $" and WorkingHours like ''" + _sch.WorkingHours + "''";
        //                    if (_sch.IsActive != default)
        //                        WhereClause += $" AND IsActive={_sch.IsActive}";

        //                    retVal = _schDAL.SearchScheduleFH(WhereClause, cmd);
        //                    return retVal;
        //                }
        //                catch (Exception ex)
        //                {
        //                    _logger.Error(ex);
        //                    throw;
        //                }
        //                finally
        //                {
        //                    if (closeConnectionFlag)
        //                        LMSDataContext.CloseMySqlConnection(cmd);
        //                }
        //            }

        //        }
        //    }
        //}
        public List<ScheduleDE> SearchSchedule(ScheduleDE mod)
        {
            List<ScheduleDE> list = new List<ScheduleDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.UserId != default && mod.UserId != null)
                    whereClause += $" AND UserId=\"{mod.UserId}\"";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                list = _schDAL.SearchSchedule(whereClause);
                foreach (var line in list)
                {
                    whereClause = "where 1=1";
                    line.ScheduleDays = _schDAL.SearchScheduleDay(whereClause += $" AND SchId={line.Id} AND IsActive ={true}");
                }

                #endregion
            }
            catch (Exception exp)
            {
                LMSDataContext.CancelTransaction(cmd);
                throw exp;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return list;
        }

       
    }
}