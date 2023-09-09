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
    public class ServicesService
    {
        #region Class Members/Class Variables

        private ServicesDAL _SvcDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public ServicesService()
        {
            _SvcDAL = new ServicesDAL();
            _corDAL = new CoreDAL();
        }


        #endregion
        #region Services
        public bool ManagementServices(ServicesDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.services.ToString());
                    check = _SvcDAL.ManageServices(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _SvcDAL.ManageServices(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _SvcDAL.AlterServices(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _SvcDAL.AlterServices(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _SvcDAL.AlterServices(mod, mod.Id);
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
        public List<ServicesDE> SearchServicess(ServicesDE mod)
        {
            List<ServicesDE> Services = new List<ServicesDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Services = _SvcDAL.SearchServicess(whereClause);

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
            return Services;
        }

        #endregion
    }
}
