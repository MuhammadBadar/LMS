using Dapper;
using LMS.Core.Entities;
using LMS.Core.Enums;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class CoreDAL
    {
        public int GetnextId(string mod)
        {
            int retVal = 0;
            MySqlCommand cmd = LMSDataContext.OpenMySqlConnection();
            try
            {
                cmd = LMSDataContext.SetStoredProcedure(cmd, "GetMaxId");
                retVal = LMSDataContext.ExecuteScalar(LMSDataContext.AddParameters(cmd
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
                LMSDataContext.CloseMySqlConnection(cmd);
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
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                top = cmd.Connection.Query<EnumValueDE>("call LMS.GetEnumValues( '" + (int)type + "')").ToList();
                return top;
            }
            catch (Exception exp)
            {
                return top;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public bool ManageEnumValue(EnumValueDE mod, MySqlCommand cmd = null)
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
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public int GetnextLineId(string mod, int headerId, string columnName)
        {
            int retVal = 0;
            MySqlCommand cmd = LMSDataContext.OpenMySqlConnection();
            try
            {
                cmd = LMSDataContext.SetStoredProcedure(cmd, "GetMaxLineId");
                retVal = LMSDataContext.ExecuteScalar(LMSDataContext.AddParameters(cmd
                    , "@prm_TableName", mod.ToString(),
                                "@prm_HeaderId", headerId,
                                "@prm_ColumnName", columnName
                    ));
                retVal += 1;
                //if (retVal != -1)
                //    retVal += 1;
                //else     
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                LMSDataContext.CloseMySqlConnection(cmd);
            }
            return retVal;
        }
    }

}
