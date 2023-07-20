using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Service
{
    public class TopicService
    {
        #region Class Variables
        private TopicDAL _topicDAL;
        private CoreDAL _coreDAL;
        private Logger _logger;
        #endregion
        #region Constructor
        public TopicService()
        {
            _topicDAL = new TopicDAL();
            _coreDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Topic
        public bool ManageTopic(TopicDE _topic)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_topic.DBoperation == DBoperations.Insert)
                    _topic.Id = _coreDAL.GetnextId(TableNames.topic.ToString());
                retVal = _topicDAL.ManageTopic(_topic, cmd);
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
        public List<TopicDE> SearchTopic(TopicDE _topic)
        {
            List<TopicDE> retVal = new List<TopicDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                string WhereClause = "Where 1=1";
                if (_topic.Id != default)
                    WhereClause += $" AND Id={_topic.Id}";
                if (_topic.CourseId != default)
                    WhereClause += $" AND CourseId={_topic.CourseId}";
                if (_topic.TopicTitle != default)
                    WhereClause += $" and TopicTitle like ''" + _topic.TopicTitle + "''";

                if (_topic.IsActive != default)
                    WhereClause += $" AND IsActive={_topic.IsActive}";

                retVal = _topicDAL.SearchTopic(WhereClause, cmd);
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
