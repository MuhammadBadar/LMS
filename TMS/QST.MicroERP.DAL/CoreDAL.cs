using Dapper;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
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
     public class CoreDAL
    {
       
        public int GetnextId(string mod)
        {
            int retVal = 0;
            MySqlCommand cmd = QAFastTrackDataContext.OpenMySqlConnection();
            try
            {
                cmd = QAFastTrackDataContext.SetStoredProcedure(cmd, "GetMaxId");
                retVal = QAFastTrackDataContext.ExecuteScalar(QAFastTrackDataContext.AddParameters(cmd
                    , "@prm_TableName", mod.ToString()
                    ));
                retVal += 1;
                //if (retVal != -1)
                //    retVal += 1;
                //else     
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return retVal;
        }

        public List<EnumValueDE> GetEnumValues(EnumType type, MySqlCommand cmd = null)
        {
            List<EnumValueDE> top = new List<EnumValueDE>();
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
                top = cmd.Connection.Query<EnumValueDE>("call microerp.GetEnumValues( '" + (int)type + "')").ToList();
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

        public bool ManageEnumValue(EnumValueDE mod, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageEnumValue";
                cmd.Parameters.AddWithValue("@id", mod.Id);
                cmd.Parameters.AddWithValue("@enumTypeId", mod.EnumTypeId);
                cmd.Parameters.AddWithValue("@value", mod.Value);

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

    }   

}
