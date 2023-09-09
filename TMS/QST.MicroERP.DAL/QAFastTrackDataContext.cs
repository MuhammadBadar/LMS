using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;
using Microsoft.Extensions.Configuration;
using System.Data.SqlClient;
using QST.MicroERP.Core.Entities;

namespace QST.MicroERP.DAL
{
   public class QAFastTrackDataContext
	{
		private readonly IConfiguration _config;
		public QAFastTrackDataContext(IConfiguration config)
        {
			_config = config;

		}

		//private static string CON_STR = new ConfigurationBuilder().Build().GetConnectionString("ConnStr");


		//public static MySqlCommand OpenMySqlConnection()
		//{
		//	try
		//	{

		//		MySqlConnection con = new MySqlConnection("server = localhost; database = MicroERP; user = root; port = 3306; password = root; SslMode = None;");

		//		MySqlCommand cmd = new MySqlCommand()
		//		{
		//			CommandTimeout = 0,
		//			CommandType = CommandType.StoredProcedure,
		//			Connection = con
		//		};
		//		con.Open();
		//		return cmd;
		//	}
		//	catch (Exception ex)
		//	{
		//		throw ex;
		//	}
		//}


		public static MySqlCommand OpenMySqlConnection()
		{
			try
			{
				MySqlConnection con = new MySqlConnection("Server = localhost; Database = microerp; Uid = root; Pwd = root;");
				MySqlCommand cmd = new MySqlCommand()
				{
					CommandTimeout = 0,
					CommandType = CommandType.StoredProcedure,
					Connection = con
				};
				con.Open();
				return cmd;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
	
		public static bool CloseMySqlConnection(MySqlCommand cmd)
		{
			try
			{
				cmd.Connection.Close();
				return true;
			}
			catch
			{
				return false;
			}
			finally
			{
				cmd.Dispose();
			}
		}
		
		public static MySqlCommand StartTransaction(MySqlCommand cmd)
		{
			try
			{
				MySqlTransaction trans = cmd.Connection.BeginTransaction();

				cmd.Transaction = trans;
				return cmd;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		
		public static MySqlCommand EndTransaction(MySqlCommand cmd)
		{
			try
			{
				cmd.Transaction.Commit();
				return cmd;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
	
		public static MySqlCommand CancelTransaction(MySqlCommand cmd)
		{
			try
			{
				cmd.Transaction.Rollback();
				return cmd;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		internal static MySqlCommand SetStoredProcedure(MySqlCommand cmd, string GetNextId)
		{

			try
			{
				cmd.CommandText = GetNextId;
				return cmd;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

		internal static MySqlCommand AddParameters(MySqlCommand cmd, params object[] parameters)
		{
			try
			{
				for (int liX = 0, liY = 1; liY < parameters.Length; liX += 2, liY += 2)
					cmd.Parameters.AddWithValue(parameters[liX].ToString(), parameters[liY]);

				return cmd;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}
		
		internal static int ExecuteScalar(MySqlCommand cmd)
		{
			try
			{
				Object obj = cmd.ExecuteScalar();

				return obj != null ? Convert.ToInt32(obj) : -1;
			}
			catch (Exception ex)
			{
				throw ex;
			}
		}

	}
}
