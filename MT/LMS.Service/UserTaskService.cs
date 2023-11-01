using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Service
{
    public class UserTaskService
    {
        #region Class Variables
        private UserTaskDAL _tskDAL;
        private CoreDAL _coreDAL;
        private Logger _logger;
        #endregion
        #region Constructor
        public UserTaskService()
        {
            _tskDAL = new UserTaskDAL();
            _coreDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region  usertask
        public bool Manageusertask(List<UserTaskDE> _tsks)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                int counter = 0;
                int lastId = 0;
                foreach (var _tsk in _tsks)
                {
                    if (_tsk.DBoperation == DBoperations.Insert)
                    {
                        if (counter == 0)
                        {
                            _tsk.Id = _coreDAL.GetnextId(TableNames.usertask.ToString());
                            lastId = _tsk.Id;
                        }
                        else
                        {
                            lastId += 1;
                            _tsk.Id = lastId;
                        }

                       counter += 1;
                    }
                    
                    retVal = _tskDAL.Manageusertask(_tsk, cmd);
                    cmd = LMSDataContext.OpenMySqlConnection();

                }

                return retVal;
            }
            catch (Exception ex)
            {
                retVal = false;
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }

            return retVal;
        }
        public List<UserTaskDE> Searchusertask(UserTaskDE _tsk)
        {
            List<UserTaskDE> retVal = new List<UserTaskDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                string WhereClause = " Where 1=1";
                if (_tsk.Id != default)
                    WhereClause += $" AND Id={_tsk.Id}";
                if (_tsk.UserId != default)
                    WhereClause += $" AND UserId={_tsk.UserId}";
                if (_tsk.TaskId != default)
                    WhereClause += $" AND TaskId={_tsk.TaskId}";
                if (_tsk.ClaimId != default)
                    WhereClause += $" AND ClaimId={_tsk.ClaimId}";
                if (_tsk.Date != default)
                    WhereClause += $" AND Date={_tsk.Date}";
                if (_tsk.IsActive != default && _tsk.IsActive == true)
                    WhereClause += $" AND IsActive=1";


                retVal = _tskDAL.Searchusertask(WhereClause, cmd);
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
    