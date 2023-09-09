using Dapper;
using QST.MicroERP.Core.Entities.Security;
using MySql.Data.MySqlClient;

using QST.MicroERP.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.DAL
{
    public class PermissionsDAL
    {

        #region Operations

        public bool ManagePermission(PermissionDE Perm, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManagePermissions";
                cmd.Parameters.AddWithValue("@id", Perm.Id);
                cmd.Parameters.AddWithValue("@featureId", Perm.FeatureId);
                cmd.Parameters.AddWithValue("@userId", Perm.UserId);
                cmd.Parameters.AddWithValue("@roleId", Perm.RoleId);
                cmd.Parameters.AddWithValue("@permissionValue", Perm.PermissionValue);     
                cmd.Parameters.AddWithValue("@createdOn", Perm.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", Perm.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", Perm.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", Perm.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", Perm.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", Perm.DBoperation.ToString());

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
        public bool AlterPermission(PermissionDE PermissionDE, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterPermission";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", PermissionDE.DBoperation.ToString());
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
        public List<PermissionDE> SearchPermissions(string whereClause, MySqlCommand cmd = null)
        {
            List<PermissionDE> top = new List<PermissionDE>();
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
                top = cmd.Connection.Query<PermissionDE>("call mrcroerp.SearchPermissions( '" + whereClause + "')").ToList();
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
