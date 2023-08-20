using Dapper;
using LMS.Core.ViewModel;
using MySql.Data.MySqlClient;
using NLog;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.DAL
{
    public class UsertaskbydateDAL
    {
        public List<UsertaskbydateVM> SearchUsertaskbydate(string whereClause, MySqlCommand cmd = null)
        {

            List<UsertaskbydateVM> top = new List<UsertaskbydateVM>();
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
                top = cmd.Connection.Query<UsertaskbydateVM>("call lms.SearchUsertaskbydate( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }

    }
}
