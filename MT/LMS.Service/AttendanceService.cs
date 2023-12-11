using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Core.ViewModel;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;
using Org.BouncyCastle.Utilities.IO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Service
{
    public class AttendanceService
    {
        #region Class Members/Class Variables

        private AttendanceDAL attDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        private ScheduleService _schSvc; 

        #endregion
        #region Constructors
        public AttendanceService()
        {
            attDAL = new AttendanceDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");

            _schSvc = new ScheduleService();
        }
        #endregion
        public bool ManageAttendance(AttendanceVM Attendance)
        {
            // class veriables/datamembers

            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (Attendance.DBoperation == DBoperations.Insert)
                    Attendance.Id = _corDAL.GetnextId(TableNames.attendance.ToString());
                retVal = attDAL.ManageAttendance(Attendance, cmd);
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

        public List<AttendanceVM> SearchAttendance(AttendanceVM mod)
        {
            List<AttendanceVM> att = new List<AttendanceVM>();
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
                if (mod.UserId != default)
                    whereClause += $" and UserId like ''" + mod.UserId + "''";
                if (mod.ScheduleTime != default)
                    whereClause += $" and SchedualTime like ''" + mod.ScheduleTime + "''";
                if (mod.DateFrom.HasValue)
                       whereClause += $" and Date >= ''{mod.DateFrom.Value:yyyy-MM-dd} 00:00:00''";
                if(mod.DateTo.HasValue)
                        whereClause += $" and Date <= ''{mod.DateTo.Value:yyyy-MM-dd} 23:59:59''";

                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                att = attDAL.SearchAttendance(whereClause, cmd);
                return att;
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
         
        }

        public double GetDueSPs(string user, DateTime inputDate)
        {
            double dueSPs = 0.00;
            string schTimes = GetScheduleTime(user, inputDate);
            if(schTimes.Contains(','))
            {
                var timeIntervals = schTimes.Split(',');
                foreach (var timeInterval in timeIntervals) 
                { 
                  var times = timeInterval.Split("-");
                    if (times.Length > 1) 
                    { 
                        //foreach(var time in times)
                        {
                            var timeParts = times[0].Split(':');
                            TimeSpan startTime = new TimeSpan(Convert.ToInt32(timeParts[0]), Convert.ToInt32(timeParts[1]), 0);

                            timeParts = times[1].Split(':');
                            TimeSpan endTime = new TimeSpan(Convert.ToInt32(timeParts[0]), Convert.ToInt32(timeParts[1]), 0);

                            dueSPs += (endTime - startTime).TotalHours;
                        }
                        // var timeParts = times
                        //TimeSpan startTime = new TimeSpan((times[0].Split(':'))[0])
                    }
                }
            }

            return dueSPs;
        }

        // This method retrieves the schedule events for a specific user and day.
        public string GetScheduleTime(string userId, DateTime inputDate)
        {
            // Initialize an empty string to store the schedule events
            string dayEvents = string.Empty;

            // Get the user's schedule based on the provided user ID
            var userSchedule = _schSvc.GetScheduleByUserId(userId);

            // Determine the day of the week from the provided date
            int dayOfWeekId = (int)inputDate.DayOfWeek;

            // Map the day of the week to a corresponding ID
            int dayId = -1;
            switch (dayOfWeekId)
            {
                // Map days of the week to specific IDs
                case 0: dayId = 1003007; break; // Sunday
                case 1: dayId = 1003001; break; // Monday
                case 2: dayId = 1003002; break; // Tuesday
                case 3: dayId = 1003003; break; // Wednesday
                case 4: dayId = 1003004; break; // Thursday
                case 5: dayId = 1003005; break; // Friday
                case 6: dayId = 1003006; break; // Saturday
            }

            // Retrieve the schedule for the specified day
            var daySchedule = userSchedule.ScheduleDays.Where(m => m.DayId == dayId).FirstOrDefault();

            // Check if the schedule for the specified day is not null
            if (daySchedule != null)
            {
                // Iterate through the schedule events for the specified day
                foreach (var eventDetail in daySchedule.ScheduleDayEvents)
                {
                    // Concatenate the start and end times into the dayEvents string
                    dayEvents += eventDetail.StartTime + " - " + eventDetail.EndTime + " ,";
                }

                // Remove the trailing comma from the concatenated string
                if (!string.IsNullOrEmpty(dayEvents))
                {
                    dayEvents = dayEvents.TrimEnd(',', ' '); // Trim the last comma and any extra whitespace
                }
            }

            // Return the final string representing schedule events for the specified day
            return dayEvents;
        }


    }
}
