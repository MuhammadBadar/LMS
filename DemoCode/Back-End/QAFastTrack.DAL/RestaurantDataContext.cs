using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;
using Microsoft.Extensions.Configuration;
using System.Data.SqlClient;
using Restaurant.Core.Entities;
using System.Dynamic;
using System.Reflection;

namespace Restaurant.DAL
{
    public class RestaurantDataContext
    {
        public readonly IConfiguration? _config = new ConfigurationBuilder ().SetBasePath (Directory.GetCurrentDirectory ()).AddJsonFile ("appsettings.json").Build ();
        public RestaurantDataContext ( )
        {

        }
        public static MySqlCommand OpenMySqlConnection ( )
        {
            RestaurantDataContext res = new RestaurantDataContext ();
            MySqlConnection con = new MySqlConnection (res._config.GetConnectionString ("ConnStr"));

            MySqlCommand cmd = new MySqlCommand ()
            {
                CommandTimeout = 0,
                CommandType = CommandType.StoredProcedure,
                Connection = con
            };
            try
            {
                con.Open ();
                return cmd;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Dispose ();
            }
        }
        public static bool CloseMySqlConnection ( MySqlCommand cmd )
        {
            try
            {
                cmd.Connection.Close ();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                cmd.Dispose ();
            }
        }
        public static MySqlCommand StartTransaction ( MySqlCommand cmd )
        {
            try
            {
                MySqlTransaction trans = cmd.Connection.BeginTransaction ();

                cmd.Transaction = trans;
                return cmd;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Dispose ();
            }
        }
        public static MySqlCommand EndTransaction ( MySqlCommand cmd )
        {
            try
            {
                cmd.Transaction.Commit ();
                return cmd;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Dispose ();
            }
        }
        public static MySqlCommand CancelTransaction ( MySqlCommand cmd )
        {
            try
            {
                cmd.Transaction.Rollback ();
                return cmd;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Dispose ();
            }
        }
        internal static MySqlCommand SetStoredProcedure ( MySqlCommand cmd, string GetNextId )
        {
            try
            {
                cmd.CommandText = GetNextId;
                return cmd;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Dispose ();
            }
        }
        internal static MySqlCommand AddParameters ( MySqlCommand cmd, params object[] parameters )
        {
            try
            {
                for (int liX = 0, liY = 1; liY < parameters.Length; liX += 2, liY += 2)
                    cmd.Parameters.AddWithValue (parameters[liX].ToString (), parameters[liY]);

                return cmd;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Dispose ();
            }
        }
        internal static int ExecuteScalar ( MySqlCommand cmd )
        {
            try
            {
                Object obj = cmd.ExecuteScalar ();

                return obj != null ? Convert.ToInt32 (obj) : -1;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Dispose ();
            }
        }
        internal static string ExecuteScalarString ( MySqlCommand cmd )
        {
            try
            {
                Object obj = cmd.ExecuteScalar ();

                return (string)(obj != null ? obj : "");
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Dispose ();
            }
        }
    }
}
