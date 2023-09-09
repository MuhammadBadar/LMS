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
    public class InquiryFieldDataService
    {
        #region Class Members/Class Variables

        private InquiryFieldDataDAL _ifdDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public InquiryFieldDataService()
        {
            _ifdDAL = new InquiryFieldDataDAL();
            _corDAL = new CoreDAL();
        }


        #endregion
        #region InquiryFieldData
        public bool ManageInquiryFieldData(List<InquiryFieldDataDE> mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                foreach (var line in mod)
                {
                    line.Id = _corDAL.GetnextId(TableNames.inquiry_field_data.ToString());
                    check = _ifdDAL.ManageInquiryFieldData(line);
                }
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
        public bool ManagementInquiryFieldData(InquiryFieldDataDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Update)
                {
                    check = _ifdDAL.ManageInquiryFieldData(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _ifdDAL.AlterInquiryFieldData(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _ifdDAL.AlterInquiryFieldData(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _ifdDAL.AlterInquiryFieldData(mod, mod.Id);
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
        public List<InquiryFieldDataVM> SearchInquiryFieldDatas(InquiryFieldDataVM mod)
        {
            List<InquiryFieldDataVM> InquiryFieldData = new List<InquiryFieldDataVM>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.FieldId != default)
                    whereClause += $" AND FieldId={mod.FieldId}";
                if (mod.FieldValue != default)
                    whereClause += $" AND FieldValue like ''" + mod.FieldValue + "''";
                if (mod.FieldName != default)
                    whereClause += $" AND FieldName like ''" + mod.FieldName + "''";
                if (mod.InquiryId != default)
                    whereClause += $" AND InquiryId={mod.InquiryId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                InquiryFieldData = _ifdDAL.SearchInquiryFieldData(whereClause);

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
            return InquiryFieldData;
        }

        #endregion
    }
}
