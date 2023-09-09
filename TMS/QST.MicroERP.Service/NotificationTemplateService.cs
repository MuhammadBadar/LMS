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
    public class NotificationTemplateService
    {
        #region Class Members/Class Variables

        private NotificationTemplateDAL _nTemDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public NotificationTemplateService()
        {
            _nTemDAL = new NotificationTemplateDAL();
            _corDAL = new CoreDAL();
        }


        #endregion
        #region NotificationTemplate
        public bool ManagementNotificationTemplate(NotificationTemplateDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.notificationtemplate.ToString());
                    check = _nTemDAL.ManageNotificationTemplate(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _nTemDAL.ManageNotificationTemplate(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _nTemDAL.AlterNotificationTemplate(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _nTemDAL.AlterNotificationTemplate(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _nTemDAL.AlterNotificationTemplate(mod, mod.Id);
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
        public List<NotificationTemplateDE> SearchNotificationTemplates(NotificationTemplateDE mod)
        {
            List<NotificationTemplateDE> NotificationTemplate = new List<NotificationTemplateDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.KeyCode != default)
                    whereClause += $" AND KeyCode like ''" + mod.KeyCode + "''";
                if (mod.TemplateName != default)
                    whereClause += $" AND TemplateName like ''" + mod.TemplateName + "''";
                if (mod.Subject != default)
                    whereClause += $" AND Subject like ''" + mod.Subject + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                NotificationTemplate = _nTemDAL.SearchNotificationTemplates(whereClause);

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
            return NotificationTemplate;
        }

        #endregion
    }
}
