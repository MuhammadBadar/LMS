using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class ScheduleService
    {
        #region Class Members/Class Variables

        private ScheduleDAL _ScheduleDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public ScheduleService()
        {
            _ScheduleDAL = new ScheduleDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Schedule
        public ScheduleDE ManagementSchedule(ScheduleDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.schedule.ToString());
                retVal = _ScheduleDAL.ManageSchedule(mod, cmd);
                if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                    foreach (var line in mod.ClassTimings)
                    {
                        line.SchId = mod.Id;
                        if (line.DBoperation == DBoperations.Insert)
                            line.Id = _corDAL.GetnextLineId(TableNames.classtiming.ToString(), mod.Id, "SchId");
                        retVal = _ScheduleDAL.ManageClassTiming(line, cmd);
                    }
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                LMSDataContext.EndTransaction(cmd);
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
                string whereClause = " Where 1=1";
                mod.ClassTimings = _ScheduleDAL.SearchClassTimings(whereClause += $" AND SchId={mod.Id} AND IsActive ={true}");
            }
            return mod;
        }
        public List<ScheduleDE> SearchSchedules(ScheduleDE mod)
        {
            List<ScheduleDE> Schedules = new List<ScheduleDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Schedules = _ScheduleDAL.SearchSchedules(whereClause);
                foreach (var line in Schedules)
                {
                    whereClause = "where 1=1";
                    line.ClassTimings = _ScheduleDAL.SearchClassTimings(whereClause += $" AND SchId={line.Id} AND IsActive ={true}");
                }

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
            return Schedules;
        }
        #endregion
    }
}
