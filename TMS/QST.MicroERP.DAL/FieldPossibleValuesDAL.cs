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
    public class FieldPossibleValuesDAL
    {
        #region Operations

        public bool ManageFieldPossibleValues(FieldPossibleValuesDE fpv, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageFieldPossibleValues";
                cmd.Parameters.AddWithValue("@id", fpv.Id);
                cmd.Parameters.AddWithValue("@fieldId", fpv.FieldId);
                cmd.Parameters.AddWithValue("@fieldValue", fpv.FieldValue);
                cmd.Parameters.AddWithValue("@createdOn", fpv.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", fpv.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", fpv.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", fpv.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", fpv.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", fpv.DBoperation.ToString());

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
        public bool AlterFieldPossibleValues(FieldPossibleValuesDE fpv, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterFieldPossibleValues";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", fpv.DBoperation.ToString());
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
        public List<FieldPossibleValuesDE> SearchFieldPossibleValues(string whereClause, MySqlCommand cmd = null)
        {
            List<FieldPossibleValuesDE> top = new List<FieldPossibleValuesDE>();
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
                top = cmd.Connection.Query<FieldPossibleValuesDE>("call QST.MicroERP.SearchFieldPossibleValues( '" + whereClause + "')").ToList();
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
