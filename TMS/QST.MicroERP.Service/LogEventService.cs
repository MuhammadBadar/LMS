using MySql.Data.MySqlClient;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Service
{
    public class LogEventService
    {
        #region Class Members/Class Variables

        private LogEventDAL _eventDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public LogEventService()
        {
            _eventDAL = new LogEventDAL();
            _corDAL = new CoreDAL();
        }


        #endregion
        #region LogEvent
        public bool ManagementLogEvent(LogEventDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.logevent.ToString());
                    check = _eventDAL.ManageLogEvent(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _eventDAL.ManageLogEvent(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _eventDAL.AlterLogEvent(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _eventDAL.AlterLogEvent(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _eventDAL.AlterLogEvent(mod, mod.Id);
                }
                if (check == true)
                    mod.DBoperation = DBoperations.NA;


                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }


        }
        public List<LogEventDE> SearchLogEvents(LogEventDE mod)
        {
            List<LogEventDE> LogEvent = new List<LogEventDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.UserId != default)
                    whereClause += $" AND UserId  like ''" + mod.UserId + "''";
                if (mod.Action != default)
                    whereClause += $" AND Action like ''" + mod.Action + "''";
                if (mod.UserName != default)
                    whereClause += $" AND UserName like ''" + mod.UserName + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                LogEvent = _eventDAL.SearchLogEvents(whereClause);

                #endregion


            }
            catch (Exception exp)
            {

                throw exp;

            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return LogEvent;
        }


        #endregion
    }
}
