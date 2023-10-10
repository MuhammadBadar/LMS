using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Service
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
                cmd = LMSDataContext.OpenMySqlConnection();


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
                   LMSDataContext.CloseMySqlConnection(cmd);
            }


        }
        public List<NotificationLogDE> SearchNotificationLogs(NotificationLogDE mod)
        {
            List<NotificationLogDE> NotificationLog = new List<NotificationLogDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();


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
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return NotificationLog;
        }

        #endregion
    }
}
