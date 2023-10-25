using LMS.Core;
using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using Microsoft.Extensions.Logging;
using MySql.Data.MySqlClient;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Service
{
    public class AssignTaskService
    {
        #region Class Variables
        private AssignTaskDAL _assignTaskDAL;
        private CoreDAL _coreDAL;
        private Logger _logger;
        #endregion
        #region Constructor
        public AssignTaskService()
        {
            _assignTaskDAL = new AssignTaskDAL();
            _coreDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Assign Task
        public bool ManageAssignedTask(AssignTaskDE _assignTask)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_assignTask.DBoperation == DBoperations.Insert)
                    _assignTask.Id = _coreDAL.GetnextId(TableNames.assignTask.ToString());
                retVal = _assignTaskDAL.ManageAssignTask(_assignTask, cmd);
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
        public List<AssignTaskDE> SearchAssignedTask(AssignTaskDE _assignTask)
        {
            List<AssignTaskDE> retVal = new List<AssignTaskDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                string WhereClause = "Where 1=1";
                if (_assignTask.LectureId != default)
                    WhereClause += $" AND LectureId={_assignTask.LectureId}";
                if (_assignTask.StudentId != default)
                    WhereClause += $" AND StudentId={_assignTask.StudentId}";
                if (_assignTask.Id != default)
                    WhereClause += $" AND Id={_assignTask.Id}";

                if (_assignTask.IsActive != default)
                    WhereClause += $" AND IsActive={_assignTask.IsActive}";

                retVal = _assignTaskDAL.SearchAssignTask(WhereClause, cmd);
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