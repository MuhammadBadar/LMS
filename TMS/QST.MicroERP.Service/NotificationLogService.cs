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
    public class NotificationLogService
    {
        #region Class Members/Class Variables

        private NotificationLogDAL _nLogDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public NotificationLogService()
        {
            _nLogDAL = new NotificationLogDAL();
            _corDAL = new CoreDAL();
        }


        #endregion
        #region NotificationLog
        public bool ManagementNotificationLog(NotificationLogDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.notification_log.ToString());
                    check = _nLogDAL.ManageNotificationLog(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _nLogDAL.ManageNotificationLog(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _nLogDAL.AlterNotificationLog(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _nLogDAL.AlterNotificationLog(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _nLogDAL.AlterNotificationLog(mod, mod.Id);
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
        public List<NotificationLogDE> SearchNotificationLogs(NotificationLogDE mod)
        {
            List<NotificationLogDE> NotificationLog = new List<NotificationLogDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.Phone != default)
                    whereClause += $" AND Name like ''" + mod.Phone + "''";
                if (mod.UserId != default)
                    whereClause += $" AND Name like ''" + mod.UserId + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                NotificationLog = _nLogDAL.SearchNotificationLogs(whereClause);

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
            return NotificationLog;
        }

        #endregion
    }
}
