using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Services
{
   public class InquiryService
    {
        #region Class Members/Class Variables

        private InquiryDAL _inqryDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public InquiryService()
        {
            _inqryDAL = new InquiryDAL();
            _corDAL = new CoreDAL();
        }

        #endregion
        #region Inquiry
        public bool ManagementInquiry(InquiryDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.inquiry.ToString());
                    check = _inqryDAL.ManageInquiry(mod);
                    foreach (var line in mod.IFData)
                    {
                        line.InquiryId=mod.Id;
                        //line.Id = _corDAL.GetnextId(TableNames.inquiry_field_data.ToString());
                        check = _inqryDAL.ManageInquiryFieldData(line);
                    }
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _inqryDAL.ManageInquiry(mod);
                    foreach (var line in mod.IFData)
                    {
                        line.InquiryId = mod.Id;
                        //line.Id = _corDAL.GetnextId(TableNames.inquiry_field_data.ToString());
                        check = _inqryDAL.ManageInquiryFieldData(line);
                    }
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _inqryDAL.AlterInquiry(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _inqryDAL.AlterInquiry(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _inqryDAL.AlterInquiry(mod, mod.Id);
                }
                if (check == true)
                    mod.DBoperation = DBoperations.NA;

                QAFastTrackDataContext.EndTransaction(cmd);
            }
            catch
            {
                QAFastTrackDataContext.CancelTransaction(cmd);
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return true;

        }
        public List<InquiryDE> GetInquiry(InquiryDE mod)
        {

            List<InquiryDE> Inquiry = SearchInquiry(mod);
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();

                #region Get FPVs 
                foreach (var line in Inquiry)
                {
                    InquiryFieldDataDE fvp = new InquiryFieldDataDE { InquiryId = line.Id, IsActive=true };
                    line.IFData = SearchInquiryFieldData(fvp);
                }
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

            return Inquiry;
        }
        public List<InquiryDE> SearchInquiry(InquiryDE mod)
        {
            List<InquiryDE> Inquiry = new List<InquiryDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ServicesId != default)
                    whereClause += $" AND ServicesId={mod.ServicesId}";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.Cell != default)
                    whereClause += $" AND Cell like ''" + mod.Cell + "''";
                if (mod.Comments != default)
                    whereClause += $" AND Comments like ''" + mod.Comments + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Inquiry = _inqryDAL.SearchInquirys(whereClause);
                foreach (var line in Inquiry)
                {
                    InquiryFieldDataDE fvp = new InquiryFieldDataDE { InquiryId = line.Id, IsActive = true };
                    line.IFData = SearchInquiryFieldData(fvp);
                }

                #endregion

                QAFastTrackDataContext.EndTransaction(cmd);
            }
            catch (Exception exp)
            {
                QAFastTrackDataContext.CancelTransaction(cmd);
                throw exp;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return Inquiry;
        }
        public List<InquiryFieldDataDE> SearchInquiryFieldData(InquiryFieldDataDE mod)
        {
            List<InquiryFieldDataDE> InquiryFieldData = new List<InquiryFieldDataDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.FieldValue != default)
                    whereClause += $" AND FieldValue like ''" + mod.FieldValue + "''";
                if (mod.FieldName != default)
                    whereClause += $" AND FieldName like ''" + mod.FieldName + "''";
                if (mod.InquiryId != default)
                    whereClause += $" AND InquiryId={mod.InquiryId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                InquiryFieldData = _inqryDAL.SearchInquiryFieldData(whereClause);

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
