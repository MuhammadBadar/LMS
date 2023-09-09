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
    public class ManageCompanyDAL
    {
        #region Operations

        public bool ManageCompany(ManageCompanyDE mngCmpny, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageCompany";
                cmd.Parameters.AddWithValue("@id", mngCmpny.Id);
                cmd.Parameters.AddWithValue("@cityId", mngCmpny.CityId);
                cmd.Parameters.AddWithValue("@provinceId", mngCmpny.ProvinceId);
                cmd.Parameters.AddWithValue("@countryId", mngCmpny.CountryId);
                cmd.Parameters.AddWithValue("@contactPerson", mngCmpny.ContactPerson);
                cmd.Parameters.AddWithValue("@name", mngCmpny.Name);
                cmd.Parameters.AddWithValue("@cell", mngCmpny.Cell);
                cmd.Parameters.AddWithValue("@telephone", mngCmpny.Telephone);
                cmd.Parameters.AddWithValue("@whatsApp", mngCmpny.WhatsApp);
                cmd.Parameters.AddWithValue("@addressLine1", mngCmpny.AddressLine1);
                cmd.Parameters.AddWithValue("@addressLine2", mngCmpny.AddressLine2);
                cmd.Parameters.AddWithValue("@createdOn", mngCmpny.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", mngCmpny.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", mngCmpny.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", mngCmpny.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", mngCmpny.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", mngCmpny.DBoperation.ToString());

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
        public bool AlterCompany(ManageCompanyDE mngCmpny, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterCompany";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", mngCmpny.DBoperation.ToString());
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
        public List<ManageCompanyDE> SearchCompany(string whereClause, MySqlCommand cmd = null)
        {
            List<ManageCompanyDE> top = new List<ManageCompanyDE>();
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
                top = cmd.Connection.Query<ManageCompanyDE>("call mrcroerp.SearchCompany( '" + whereClause + "')").ToList();
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
    }
}
