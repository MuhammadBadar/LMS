using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.DAL
{
    public class CityDAL
    {
        #region Operations

        public bool ManageCity(CityDE vcb, MySqlCommand? cmd)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "Manage_City";
                cmd.Parameters.AddWithValue("@prm_Id", vcb.Id);
                cmd.Parameters.AddWithValue("@prm_Name", vcb.Name);
                cmd.Parameters.AddWithValue("@prm_CreatedOn", vcb.CreatedOn);
                cmd.Parameters.AddWithValue("@prm_CreatedBy", vcb.CreatedById);
                cmd.Parameters.AddWithValue("@prm_ModifiedOn", vcb.ModifiedOn);
                cmd.Parameters.AddWithValue("@prm_ModifiedBy", vcb.ModifiedById);
                cmd.Parameters.AddWithValue("@prm_IsActive", vcb.IsActive);
                cmd.Parameters.AddWithValue("@prm_DBoperation", vcb.DBoperation.ToString());
                cmd.Parameters.AddWithValue("@prm_Filter", vcb.DBoperation.ToString());
                
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public bool AlterCity(CityDE cty, int? Id = null, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "AlterCity";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", cty.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<CityDE> SearchCity(string whereClause, MySqlCommand cmd = null)
        {
            List<CityDE> top = new List<CityDE>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                top = cmd.Connection.Query<CityDE>("call lms.Get_City( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception)
            {

                return top;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }

        #endregion
    }
}
