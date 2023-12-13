using Google.Protobuf.WellKnownTypes;
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
        private ScheduleDayEventDAL _schDayEventDAL;
        private CoreDAL _corDAL;
        private Logger _logger;
        private ScheduleDayEventService _schDayEvntSvc;


        public ScheduleService()
        {
            _schDAL = new ScheduleDAL();
            _schDayEventDAL = new ScheduleDayEventDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
            _schDayEvntSvc = new ScheduleDayEventService();
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
                    //if (mod.DBoperation == DBoperations.Insert)
                    schDayId = _corDAL.GetnextId(TableNames.scheduleday.ToString());
                    var sch = GetScheduleByUserId(mod.UserId);

                    if (mod.DBoperation == DBoperations.Update)
                    {
                        //var sch = GetScheduleByUserId(mod.UserId);
                        foreach(var schDay in sch.ScheduleDays)
                        {
                            //if(mod.DayIds.Where(m => m == schDay.DayId.Value).FirstOrDefault() != null)
                            bool shouldDelete = true;
                            foreach(var scheduleDayId in mod.DayIds)
                            {
                                if(schDay.DayId == scheduleDayId)
                                {
                                    shouldDelete = false;
                                }
                            }
                            if (shouldDelete)
                            {
                                schDay.DBoperation = DBoperations.Delete;
                                _schDAL.ManageScheduleDay(schDay, cmd);
                            }
                        }
                    }
                    
                    foreach (var day in mod.DayIds)
                    {
                        bool shouldAdd = true;
                        foreach (var schDay in sch.ScheduleDays)
                        {
                            if(day == schDay.DayId)
                            {
                                shouldAdd = false;
                            }
                        }

                        if (shouldAdd)
                        {
                            var SchLine = new ScheduleDayDE();
                            SchLine.Id = schDayId;
                            SchLine.DayId = day;
                            SchLine.SchId = mod.Id;
                            SchLine.DBoperation = DBoperations.Insert;
                            SchLine.IsActive = true;
                            retVal = _schDAL.ManageScheduleDay(SchLine, cmd);
                            schDayId += 1;

                            // Write code to save Schedule Day Line
                            ScheduleDayEventDE schDayEvnt = new ScheduleDayEventDE();
                            schDayEvnt.StartTime = "00:00";
                            //...
                            _schDAL.ManageScheduleDayEvent(schDayEvnt);
                        }
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
         public bool ManageScheduleDay(ScheduleDayDE schDay)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (schDay.DBoperation == DBoperations.Insert)
                    schDay.Id = _corDAL.GetnextId(TableNames.scheduleday.ToString());
                if(schDay.DBoperation == DBoperations.Delete)
                {
                    // Write logic to delete schedule day event(s)
                    
                    var schDayEvents = _schDayEvntSvc.GetScheduleDayEvents(schDay.Id);
                    foreach(var schDayEvent in schDayEvents)
                    {
                        schDayEvent.DBoperation = DBoperations.Delete;
                        _schDayEventDAL.ManageScheduleDayEvent(schDayEvent);
                    }

                }
                retVal = _schDAL.ManageScheduleDay(schDay, cmd);
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

        #region GetDueSPs
        //public float GetDueSPs(string userId, DateTime date)
        //{
        //    ScheduleDE sch = new ScheduleDE();
        //    //bool closeConnectionFlag = false;
        //    MySqlCommand? cmd = null;
        //    float dueSps = 0;
        //    TimeSpan Sps = new TimeSpan ();
        //    Sps = TimeSpan.FromHours(4);

        //    try
        //    {
        //        //cmd = LMSDataContext.OpenMySqlConnection();
        //        //LMSDataContext.StartTransaction(cmd);

        //        #region Search

        //        string whereClause = " Where 1=1";
        //        if (!string.IsNullOrWhiteSpace(userId))
        //            whereClause += $" AND UserId=\"{userId}\" AND IsActive ={true}";

        //        var list = _schDAL.SearchSchedule(whereClause);
        //        if (list.Count > 0)
        //        {
        //            sch = list.LastOrDefault ();
        //            whereClause = "where 1=1";
        //            List<ScheduleDayDE> currentDaySch = _schDAL.SearchScheduleDay (whereClause += $" AND SchId={sch.Id} and DAY=\"{date.DayOfWeek.ToString ()}\" AND IsActive ={true}");
        //            if (currentDaySch != null && currentDaySch.Count () > 0)
        //            {
        //                whereClause = "where 1=1";
        //                currentDaySch[0].ScheduleDayEvents = _schDAL.SearchScheduleDayEvent (whereClause += $" AND ScheduleDayId={currentDaySch[0].Id} AND IsActive ={true}");
        //                if (currentDaySch[0].ScheduleDayEvents != null && currentDaySch[0].ScheduleDayEvents.Count > 0)
        //                    foreach (var schDayEvent in currentDaySch[0].ScheduleDayEvents)
        //                    {
        //                        TimeSpan startTime = TimeSpan.Parse (schDayEvent.StartTime);
        //                        TimeSpan endTime = TimeSpan.Parse (schDayEvent.EndTime);
        //                        TimeSpan timeDifference = endTime - startTime;
        //                        Sps += timeDifference;
        //                    }
        //                //else
        //                 //   Sps = TimeSpan.FromHours (4);
        //            }
        //            //else
        //              //  Sps = TimeSpan.FromHours (4);
        //        }
        //        //else
        //          //  Sps = TimeSpan.FromHours (4);

        //        dueSps = (float)Math.Round (Sps.TotalHours, 2);
        //        #endregion
        //    }
        //    catch (Exception exp)
        //    {
        //        //LMSDataContext.CancelTransaction(cmd);
        //        throw exp;
        //    }
        //    finally
        //    {
        //        //if (closeConnectionFlag)
        //        //LMSDataContext.CloseMySqlConnection(cmd);
        //    }

        //    sch.UserId = userId;
        //    return dueSps;
        //}

        // Function to calculate schedule points based on start time and end time
        private float CalculateSchedulePoints(DateTime startTime, DateTime endTime)
        {
            // Your calculation logic goes here
            // Example: Calculate the difference in hours as SPs with fractional part
            TimeSpan timeDifference = endTime - startTime;
            float schedulePoints = (float)timeDifference.TotalHours;

            // Round to one decimal place and format the result
            string formattedSchedulePoints = schedulePoints.ToString("0.0");

            // Convert the formatted string back to float
            float roundedSchedulePoints = float.Parse(formattedSchedulePoints);

            return roundedSchedulePoints;
        }


        #endregion


        #region GetScheduleByUserId
        // This region defines the method for retrieving a user's schedule.
        public ScheduleDE GetScheduleByUserId(string userId)
        {
            ScheduleDE sch = new ScheduleDE();
            MySqlCommand? cmd = null;
            try
            {
                string whereClause = " Where 1=1";

                if (!string.IsNullOrWhiteSpace(userId))
                    whereClause += $" AND UserId=\"{userId}\" AND IsActive ={true}";

                var list = _schDAL.SearchSchedule(whereClause);

                if (list.Count > 0)
                {
                    sch = list.LastOrDefault();
                }

                whereClause = "where 1=1";

                sch.ScheduleDays = _schDAL.SearchScheduleDay(whereClause += $" AND SchId={sch.Id} AND IsActive ={true}");

                if (sch.ScheduleDays != null && sch.ScheduleDays.Count > 0)
                {
                    foreach (var schDay in sch.ScheduleDays)
                    {
                        if (schDay.DayId > 0)
                        {
                            sch.DayIds.Add(schDay.DayId);

                            whereClause = "where 1=1";

                            schDay.ScheduleDayEvents = _schDAL.SearchScheduleDayEvent(whereClause += $" AND ScheduleDayId={schDay.Id} AND IsActive ={true}");

                            foreach (var schDayEvent in schDay.ScheduleDayEvents)
                            {
                                schDay.Location = schDayEvent.Location;
                                schDay.EventType = schDayEvent.EventType;

                                // Convert StartTime and EndTime to DateTime and calculate the sum
                                if (!string.IsNullOrEmpty(schDayEvent.StartTime) && !string.IsNullOrEmpty(schDayEvent.EndTime))
                                {
                                    if (DateTime.TryParse(schDayEvent.StartTime, out DateTime startTime) && DateTime.TryParse(schDayEvent.EndTime, out DateTime endTime))
                                    {
                                        TimeSpan timeDifference = endTime - startTime;
                                        schDayEvent.Sp = Math.Round(timeDifference.TotalHours,2); // Use TotalHours for the total number of hours
                                    }
                                }

                                string eventString = $"{schDayEvent.StartTime} - {schDayEvent.EndTime} ({schDayEvent.Sp} Sp's) {schDayEvent.EventType} {schDayEvent.Location}";

                                if (schDayEvent != schDay.ScheduleDayEvents.Last())
                                {
                                    eventString += " , ";
                                }

                                schDay.SchDayEvents += eventString;
                            }
                        }
                    }
                }
            }
            catch (Exception exp)
            {
                throw exp;
            }
            finally
            {
                // Close the database connection if necessary
            }

            sch.UserId = userId;
            return sch;
        }

        #endregion


    }
}