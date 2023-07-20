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
    public class LectureService
    {
        #region Class Variables
        private LectureDAL _lecDAL;
        private CoreDAL _coreDAL;
        private Logger _logger;
        #endregion
        #region Constructor
        public LectureService()
        {
            _lecDAL = new LectureDAL();
            _coreDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region  Lecture
        public bool ManageLecture(LectureDE _lec)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_lec.DBoperation == DBoperations.Insert)
                    _lec.Id = _coreDAL.GetnextId(TableNames.lecture.ToString());
                retVal = _lecDAL.ManageLecture(_lec, cmd);
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
        public List<LectureDE> SearchLecture(LectureDE _lec)
        {
            List<LectureDE> retVal = new List<LectureDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                string WhereClause = " Where 1=1";
                if (_lec.Id != default)
                    WhereClause += $" AND Id={_lec.Id}";
                if (_lec.TopicId != default)
                    WhereClause += $" AND TopicId={_lec.TopicId}";
                if (_lec.CourseId != default)
                    WhereClause += $" AND CourseId={_lec.CourseId}";
                if (_lec.Title != default)
                    WhereClause += $" and Title like ''" + _lec.Title + "''";
                if (_lec.Description != default)
                    WhereClause += $" and Description like ''" + _lec.Description + "''";
                if (_lec.URL != default)
                    WhereClause += $" and URL like ''" + _lec.URL + "''";
                if (_lec.IsActive != default && _lec.IsActive == true)
                    WhereClause += $" AND IsActive=1";


                retVal = _lecDAL.SearchLecture(WhereClause, cmd);
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
