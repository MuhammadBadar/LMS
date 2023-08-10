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

        public bool ManageSchedule(ScheduleDE _Sch)
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
                    _Sch.Id = _corDAL.GetnextId(TableNames.ScheduleDaysEvents.ToString());
                retVal = _schDAL.ManageSchedule(_Sch, cmd);
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
      public List<ScheduleDE> SearchSchedule(ScheduleDE mod)
        {
            List<ScheduleDE> list = new List<ScheduleDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                //#region Search

                //string whereClause = " Where 1=1";
                //if (mod.I != default)
                //    whereClause += $" AND Id={mod.Id}";
                //if (mod.Name != default)
                //    whereClause += $" AND Name like ''" + mod.Name + "''";
                //if (mod.IsActive != default)
                //    whereClause += $" AND IsActive ={mod.IsActive}";
                //Feature = _featDAL.SearchFeatures(whereClause);

                //#endregion
                list = _schDAL.SearchSchedule("");



                LMSDataContext.EndTransaction(cmd);
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

        public bool ManageScheduleDayEvent(ScheduleDaysEventsDE _Sch)
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
                    _Sch.Id = _corDAL.GetnextId(TableNames.ScheduleDaysEvents.ToString());
                retVal = _schDAL.ManageScheduleDayEvents(_Sch, cmd);
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
        public List<ScheduleDaysEventsDE> SearchScheduleDayEvents(ScheduleDaysEventsDE mod)
        {
            List<ScheduleDaysEventsDE> list = new List<ScheduleDaysEventsDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                //#region Search

                //string whereClause = " Where 1=1";
                //if (mod.I != default)
                //    whereClause += $" AND Id={mod.Id}";
                //if (mod.Name != default)
                //    whereClause += $" AND Name like ''" + mod.Name + "''";
                //if (mod.IsActive != default)
                //    whereClause += $" AND IsActive ={mod.IsActive}";
                //Feature = _featDAL.SearchFeatures(whereClause);

                //#endregion
                list = _schDAL.SearchScheduleDayEvents("");



                LMSDataContext.EndTransaction(cmd);
            }
            catch (Exception exp)
            {
                LMSDataContext.CancelTransaction(cmd);
                throw ;
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



