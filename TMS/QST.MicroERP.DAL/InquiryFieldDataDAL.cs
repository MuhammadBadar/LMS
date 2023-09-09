using Dapper;
using MySql.Data.MySqlClient;
using QST.MicroERP.Core.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.DAL
{
    public class InquiryFieldDataDAL
    {
        #region Operations

        public bool ManageInquiryFieldData(InquiryFieldDataDE ifd, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "ManageInquiryFieldData";
                cmd.Parameters.AddWithValue("@id", ifd.Id);
                cmd.Parameters.AddWithValue("@inquiryId", ifd.InquiryId);
                cmd.Parameters.AddWithValue("@fieldName", ifd.FieldName);
                cmd.Parameters.AddWithValue("@fieldValue", ifd.FieldValue);
                cmd.Parameters.AddWithValue("@createdOn", ifd.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", ifd.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", ifd.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", ifd.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", ifd.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", ifd.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        public bool AlterInquiryFieldData(InquiryFieldDataDE InquiryFieldData, int? Id = null, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "AlterInquiryFieldData";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", InquiryFieldData.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ifd)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<InquiryFieldDataVM> SearchInquiryFieldData(string whereClause, MySqlCommand cmd = null)
        {
            List<InquiryFieldDataVM> top = new List<InquiryFieldDataVM>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                top = cmd.Connection.Query<InquiryFieldDataVM>("call QST.MicroERP.SearchInquiryFieldData( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception ifd)
            {

                return top;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }

        #endregion
    }
}
