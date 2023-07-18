using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MicroERP.Core.Entities;
using MicroERP.DAL;
using Microsoft.Extensions.Logging;
using MySql.Data.MySqlClient;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MicroERP.Service
{
    public class VocabularyService
    {
        private VocabularyDAL _vcbDAL;
        private CoreDAL _corDAL;
        private Logger _logger;


        public VocabularyService()
        {
            _vcbDAL = new VocabularyDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }

        public bool ManageVocabulary(VocabularyDE _vocabulary)
        {
            // class veriables/datamembers

            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_vocabulary.DBoperation == DBoperations.Insert)
                    _vocabulary.Id = _corDAL.GetnextId(TableNames.Vocabulary.ToString());
                retVal = _vcbDAL.ManageVocabulary(_vocabulary, cmd);
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

        //public List<VocabularyDE> SearchVocabulary(VocabularySearchCriteria mod)
        public List<VocabularyDE> SearchVocabulary(VocabularyDE mod)
        {
            List<VocabularyDE> list = new List<VocabularyDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                //#region Search

                //string whereClause = " Where 1=1";
                //if (mod.I != default)
                //    whereClause += $" AND Id={mod.Id}";
                //if (mod.Name != default)
                //    whereClause += $" AND Name like ''" + mod.Name + "''";
                //if (mod.IsActive != default)
                //    whereClause += $" AND IsActive ={mod.IsActive}";
                //Feature = _featDAL.SearchFeatures(whereClause);

                //#endregion
                list = _vcbDAL.SearchVocabulary("");



                LMSDataContext.EndTransaction(cmd);
            }
            catch (Exception exp)
            {
               LMSDataContext.CancelTransaction(cmd);
                throw exp;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return list;
        }
    }
    }

    
