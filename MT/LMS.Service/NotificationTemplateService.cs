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
                cmd = LMSDataContext.OpenMySqlConnection();


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
                    LMSDataContext.CloseMySqlConnection(cmd);
            }


        }
        public List<NotificationTemplateDE> SearchNotificationTemplates(NotificationTemplateDE mod)
        {
            List<NotificationTemplateDE> NotificationTemplate = new List<NotificationTemplateDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();


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
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return NotificationTemplate;
        }

        #endregion
    }
}
