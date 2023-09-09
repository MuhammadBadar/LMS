using Dapper;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.ViewModel;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.DAL
{
    public class FieldDAL
    {
        #region Operations

        public bool ManageField(FieldDE field, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageField";
                cmd.Parameters.AddWithValue("@id", field.Id);
                cmd.Parameters.AddWithValue("@title", field.Title);
                cmd.Parameters.AddWithValue("@typeId", field.TypeId);
                cmd.Parameters.AddWithValue("@isRequired", field.IsRequired);
                cmd.Parameters.AddWithValue("@createdOn", field.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", field.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", field.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", field.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", field.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", field.DBoperation.ToString());

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
        public bool AlterField(FieldDE field, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterField";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", field.DBoperation.ToString());
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
        public List<FieldVM> SearchFields(string whereClause, MySqlCommand cmd = null)
        {
            List<FieldVM> top = new List<FieldVM>();
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
                top = cmd.Connection.Query<FieldVM>("call QST.MicroERP.SearchField( '" + whereClause + "')").ToList();
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
