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
    public class ManageCompanyService
    {
        #region Class Members/Class Variables

        private ManageCompanyDAL _comDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public ManageCompanyService()
        {
            _comDAL = new ManageCompanyDAL();
            _corDAL = new CoreDAL();
        }

        #endregion
        #region ResourceCompany
        public bool ManagementCompany(ManageCompanyDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.company.ToString());
                    check = _comDAL.ManageCompany(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _comDAL.ManageCompany(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _comDAL.AlterCompany(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _comDAL.AlterCompany(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _comDAL.AlterCompany(mod, mod.Id);
                }
                if (check == true)
                    mod.DBoperation = DBoperations.NA;

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }



        }
        public List<ManageCompanyDE> SearchCompany(ManageCompanyDE mod)
        {
            List<ManageCompanyDE> ResourceCompany = new List<ManageCompanyDE>();
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
                if (mod.ContactPerson != default)
                    whereClause += $" AND ContactPerson like ''" + mod.ContactPerson + "''";
                if (mod.WhatsApp != default)
                    whereClause += $" AND WhatsApp like ''" + mod.WhatsApp + "''";
                if (mod.Cell != default)
                    whereClause += $" AND Cell like ''" + mod.Cell + "''";
                if (mod.Telephone != default)
                    whereClause += $" AND Telephone like ''" + mod.Telephone + "''";
                if (mod.CityId != default)
                    whereClause += $" AND CityId={mod.CityId}";
                if (mod.CountryId != default)
                    whereClause += $" AND CountryId ={mod.CountryId}";
                if (mod.ProvinceId != default)
                    whereClause += $" AND ProvinceId ={mod.ProvinceId}";
                if (mod.IsActive != default)
                    if (mod.IsActive != default)
                        whereClause += $" AND IsActive ={mod.IsActive}";
                ResourceCompany = _comDAL.SearchCompany(whereClause);

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
            return ResourceCompany;
        }

        #endregion
    }
}
