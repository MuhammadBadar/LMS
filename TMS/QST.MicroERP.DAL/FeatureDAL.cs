using Dapper;
using QST.MicroERP.Core.Entities.Security;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.DAL
{
    public class FeatureDAL
    {
        #region Operations

        public bool ManageFeature(FeatureDE Feature, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageFeature";
                cmd.Parameters.AddWithValue("@id", Feature.Id);
                cmd.Parameters.AddWithValue("@name", Feature.Name);
                cmd.Parameters.AddWithValue("@description", Feature.Description);
                cmd.Parameters.AddWithValue("@createdOn", Feature.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", Feature.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", Feature.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", Feature.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", Feature.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", Feature.DBoperation.ToString());

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
        public bool AlterFeature(FeatureDE Feature, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterFeature";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", Feature.DBoperation.ToString());
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
        public List<FeatureDE> SearchFeatures(string whereClause, MySqlCommand cmd = null)
        {
            List<FeatureDE> top = new List<FeatureDE>();
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
                top = cmd.Connection.Query<FeatureDE>("call mrcroerp.SearchFeature( '" + whereClause + "')").ToList();
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
