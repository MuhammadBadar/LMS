using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Core.ViewModel;
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
                if (mod.Date.HasValue)
                       whereClause += $" and Date >= ''{mod.Date.Value:yyyy-MM-dd} 00:00:00''";

                    //if (mod.from.HasValue)
                    //    whereClause += $" and Date >= ''{mod.from.Value:yyyy-MM-dd} 00:00:00''";

                    //if (mod.to.HasValue )
                    //    whereClause += $" AND Date <= ''{mod.to.Value:yyyy-MM-dd} 23:59:59''";
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

        public string GetScheduleTime(string userId, DateTime inputDate)
        {
            string dayEvents = string.Empty;
            var sch = _schSvc.GetScheduleByUserId(userId);
            int dayOfWeekId = (int)inputDate.DayOfWeek; //
            int dayId = -1;
            //Sunday = 0,
            //Monday = 1,
            //Tuesday = 2,
            //Wednesday = 3,
            //Thursday = 4,
            //Friday = 5,
            //Saturday = 6
            switch (dayOfWeekId)
            {
                case 0: dayId = 1003007; break;
                case 1: dayId = 1003001; break;
                case 2: dayId = 1003002; break;
                case 3: dayId = 1003003; break;
                case 4: dayId = 1003004; break;
                case 5: dayId = 1003005; break;
                case 6: dayId = 1003006; break;
            }

            var schDay = sch.ScheduleDays.Where(m => m.DayId == dayId).FirstOrDefault();

            if (schDay != null)
            {
                foreach (var dayEvent in schDay.ScheduleDayEvents)
                {
                    dayEvents += dayEvent.StartTime + " - " + dayEvent.EndTime + " ,";
                }

                // Remove the trailing comma
                if (!string.IsNullOrEmpty(dayEvents))
                {
                    dayEvents = dayEvents.TrimEnd(',', ' '); // Trim the last comma and any extra whitespace
                }
            }

            return dayEvents;
        }

    }
}
