using Dapper;
using QST.MicroERP.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.DAL
{
   public class InquiryDAL
    {
        #region Inquiry Operations

        public bool ManageInquiry(InquiryDE Inquiry, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageInquiry";
                cmd.Parameters.AddWithValue("@id", Inquiry.Id);
                cmd.Parameters.AddWithValue("@name", Inquiry.Name);
                cmd.Parameters.AddWithValue("@cell", Inquiry.Cell);
                cmd.Parameters.AddWithValue("@email", Inquiry.Email);
                cmd.Parameters.AddWithValue("@servicesId", Inquiry.ServicesId);
                cmd.Parameters.AddWithValue("@comments", Inquiry.Comments);
                cmd.Parameters.AddWithValue("@createdOn", Inquiry.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", Inquiry.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", Inquiry.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", Inquiry.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", Inquiry.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", Inquiry.DBoperation.ToString());

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
        public bool AlterInquiry(InquiryDE Inquiry, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterInquiry";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", Inquiry.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception exp)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<InquiryDE> SearchInquirys(string whereClause, MySqlCommand cmd = null)
        {
            List<InquiryDE> top = new List<InquiryDE>();
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
                top = cmd.Connection.Query<InquiryDE>("call QST.MicroERP.SearchInquiry( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception exp)
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
        #region Inquiry Field Data Operations

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
                Console.WriteLine(ex);
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
        public List<InquiryFieldDataDE> SearchInquiryFieldData(string whereClause, MySqlCommand cmd = null)
        {
            List<InquiryFieldDataDE> top = new List<InquiryFieldDataDE>();
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
                top = cmd.Connection.Query<InquiryFieldDataDE>("call QST.MicroERP.SearchInquiryFieldData( '" + whereClause + "')").ToList();
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
