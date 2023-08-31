using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;

namespace LMS.DAL
{
    public class VocabularyDAL
    {
        #region DbOperations
        public bool ManageVocabulary(VocabularyDE _vcb, MySqlCommand? cmd)
        {
            bool closeConnection = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                cmd.CommandText = "ManageVocabulary";
                cmd.Parameters.AddWithValue("id", _vcb.Id);
                cmd.Parameters.AddWithValue("word", _vcb.Word);
                cmd.Parameters.AddWithValue("englishMeaning", _vcb.EnglishMeaning);
                cmd.Parameters.AddWithValue("reference", _vcb.Reference);
                cmd.Parameters.AddWithValue("sentance", _vcb.Sentance);
                cmd.Parameters.AddWithValue("pronunciation", _vcb.Pronunciation);
                cmd.Parameters.AddWithValue("comment", _vcb.Comment);
                cmd.Parameters.AddWithValue("urduMeaning", _vcb.UrduMeaning);
                cmd.Parameters.AddWithValue("createdOn", _vcb.CreatedOn);
                cmd.Parameters.AddWithValue("createdById", _vcb.CreatedById);
                cmd.Parameters.AddWithValue("modifiedOn", _vcb.ModifiedOn);
                cmd.Parameters.AddWithValue("modifiedById", _vcb.ModifiedById);
                cmd.Parameters.AddWithValue("isActive", _vcb.IsActive);
                cmd.Parameters.AddWithValue("DbOperation", _vcb.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (closeConnection)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<VocabularyDE> SearchVocabulary(string WhereClause, MySqlCommand cmd)
        {
            bool closeConnection = false;
            //WhereClause = string.Empty;
            List<VocabularyDE> lec = new List<VocabularyDE>();
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                lec = cmd.Connection.Query<VocabularyDE>("call lms.SearchVocabulary('" + WhereClause + "')").ToList();
                return lec;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnection)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        #endregion
    }
}
