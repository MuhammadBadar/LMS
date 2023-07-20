using Dapper;
using LMS.Core.Entities;
using LMS.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.DAL
{
    public class VocabularyDAL
    {
        #region Operations

        public bool ManageVocabulary(VocabularyDE vcb, MySqlCommand? cmd)
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
                cmd.CommandText = "Manage_Vocabulary";
                cmd.Parameters.AddWithValue("@prm_Id", vcb.Id);
                cmd.Parameters.AddWithValue("@prm_Word", vcb.Word);
                cmd.Parameters.AddWithValue("@prm_Meaning", vcb.Meaning);
                cmd.Parameters.AddWithValue("@prm_Reference", vcb.Reference);
                cmd.Parameters.AddWithValue("@prm_Sentance", vcb.Sentance);
                cmd.Parameters.AddWithValue("@prm_Pronunciation", vcb.Pronunciation);
                cmd.Parameters.AddWithValue("@prm_Translation", vcb.Translation);
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
        public bool AlterVocabulary(VocabularyDE vcb, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterVocabulary";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@DBoperation", vcb.DBoperation.ToString());
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
        public List<VocabularyDE> SearchVocabulary(string whereClause, MySqlCommand cmd = null)
        {
            List<VocabularyDE> top = new List<VocabularyDE>();
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
                top = cmd.Connection.Query<VocabularyDE>("call lms.Get_Vocabulary( '" + whereClause + "')").ToList();
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
    

