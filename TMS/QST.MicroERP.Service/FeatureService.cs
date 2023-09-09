using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Entities.Security;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
using QST.MicroERP.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Services
{
    public class FeatureService
    {

        #region Class Members/Class Variables

        private FeatureDAL _featDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public FeatureService()
        {
            _featDAL = new FeatureDAL();
            _corDAL = new CoreDAL();
        }


        #endregion
        #region Feature
        public bool ManagementFeature(FeatureDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
             

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.feature.ToString());
                    check = _featDAL.ManageFeature(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _featDAL.ManageFeature(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _featDAL.AlterFeature(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _featDAL.AlterFeature(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _featDAL.AlterFeature(mod, mod.Id);
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
        public List<FeatureDE> SearchFeatures(FeatureSearchCriteria mod)
        {
            List<FeatureDE> Feature = new List<FeatureDE>();
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
                Feature = _featDAL.SearchFeatures(whereClause);

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
            return Feature;
        }

        #endregion

    }
}
