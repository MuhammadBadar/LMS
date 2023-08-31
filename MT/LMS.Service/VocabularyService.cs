using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

namespace LMS.Service
{
    public class VocabularyService
    {
        #region Class Variables
        private VocabularyDAL _vcbDAL;
        private CoreDAL _coreDAL;
        private Logger _logger;
        #endregion
        #region Constructor
        public VocabularyService()
        {
            _vcbDAL = new VocabularyDAL();
            _coreDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region  Vocabulary
        public bool ManageVocabulary(VocabularyDE _vcb)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_vcb.DBoperation == DBoperations.Insert)
                    _vcb.Id = _coreDAL.GetnextId(TableNames.vocabulary.ToString());
                retVal = _vcbDAL.ManageVocabulary(_vcb, cmd);
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<VocabularyDE> SearchVocabulary(VocabularyDE _vcb)
        {
            List<VocabularyDE> retVal = new List<VocabularyDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                string WhereClause = " Where 1=1";
                if (_vcb.Id != default)
                    WhereClause += $" AND Id={_vcb.Id}";
                if (_vcb.Word != default)
                    WhereClause += $" and Word like ''" + _vcb.Word + "''";
                if (_vcb.EnglishMeaning != default)
                    WhereClause += $" and EnglishMeaning like ''" + _vcb.EnglishMeaning + "''";
                if (_vcb.Reference != default)
                    WhereClause += $" and Reference like ''" + _vcb.Reference + "''";
                if (_vcb.Sentance != default)
                    WhereClause += $" and Sentance like ''" + _vcb.Sentance + "''";
                if (_vcb.Pronunciation != default)
                    WhereClause += $" and Pronunciation like ''" + _vcb.Pronunciation + "''";
                if (_vcb.Comment != default)
                    WhereClause += $" and Comment like ''" + _vcb.Comment + "''";
                if (_vcb.UrduMeaning != default)
                    WhereClause += $" and UrduMeaning like ''" + _vcb.UrduMeaning + "''";
                if (_vcb.IsActive != default && _vcb.IsActive == true)
                    WhereClause += $" AND IsActive=1";


                retVal = _vcbDAL.SearchVocabulary(WhereClause, cmd);
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw;
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
