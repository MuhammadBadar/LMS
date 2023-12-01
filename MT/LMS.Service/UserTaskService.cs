using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Core.SearchCriteria;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;

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
                    // write code here to validate that a task for a single user can be saved for just one time only
                    //var existingTask = //Searchusertask()

                    // Create a TaskSearchCriteria object to define search criteria for existing tasks
                    TaskSearchCriteria sc = new TaskSearchCriteria();

                    // Set the TaskId property of the search criteria to the Task's Id
                    sc.TaskId = _tsk.TaskId;
                    sc.UserId = _tsk.UserId;
                    sc.Date = _tsk.Date;
                    // Perform a search for existing tasks based on the specified criteria
                    var existingTask = Searchusertask(sc);
                    // Check if there are no existing tasks found
                    if (_tsk.DBoperation == DBoperations.Insert && existingTask.Count == 0)
                    {
                        // If there are no existing tasks, proceed to save the new task

                        // Manage the user task using the _tskDAL.Manageusertask method
                        // Note: The cmd variable should have been initialized before this point
                        // (e.g., using a using statement or other means of obtaining a MySqlCommand)
                        retVal = _tskDAL.Manageusertask(_tsk, cmd);

                        // Open a new MySqlConnection using the LMSDataContext.OpenMySqlConnection() method
                        //cmd = LMSDataContext.OpenMySqlConnection();
                    }
                    else if(_tsk.DBoperation == DBoperations.Update)
                    {
                        retVal = _tskDAL.Manageusertask(_tsk, cmd);
                    }
                    // If there are existing tasks, you may choose to handle this scenario accordingly
                    // (e.g., provide a message to the user, log the attempt, etc.)
                    // Alternatively, you might want to add an else block to handle this case explicitly.


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
        //public List<UserTaskDE> GetTasksByUsertaskId(string userId)
        //{
        //    List<UserTaskDE> tasks = new List<UserTaskDE>();
        //    bool closeConnectionFlag = false;
        //    MySqlCommand cmd = null;
        //    try
        //    {
        //        cmd = LMSDataContext.OpenMySqlConnection();
        //        LMSDataContext.StartTransaction(cmd);

        //        string whereClause = $"WHERE UserId = {userId} AND IsActive = 1"; // Assuming IsActive is a column indicating active tasks

        //        tasks = _tskDAL.Searchusertask(whereClause);

        //        // Fetch attachments for each task
        //    }
        //    catch (Exception exp)
        //    {
        //        LMSDataContext.CancelTransaction(cmd);
        //        throw exp;
        //    }
        //    finally
        //    {
        //        if (closeConnectionFlag)
        //            LMSDataContext.CloseMySqlConnection(cmd);
        //    }
        //    return tasks;
        //}

        public List<UserTaskDE> Searchusertask(TaskSearchCriteria _tsk)
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
                    //WhereClause += $" AND UserId='{_tsk.UserId}'";
                    // WhereClause += $" and UserId = \'" + _tsk.UserId + "\'";
                    WhereClause += $" and UserId = ''" + _tsk.UserId + "''";
                if (_tsk.TaskId != default)
                    WhereClause += $" AND TaskId={_tsk.TaskId}";
                if (_tsk.ClaimId != default)
                    WhereClause += $" AND ClaimId={_tsk.ClaimId}";
                if (_tsk.SP != default)
                    WhereClause += $" AND sp={_tsk.SP}";
                if (_tsk.Date != default(DateTime))
                    WhereClause += $" AND DATE(Date) = ''{_tsk.Date.ToString("yyyy-MM-dd")}''";
                 if (_tsk.IsActive != default && _tsk.IsActive == true)
                    WhereClause += $" AND IsActive=1";

                /*if (_tsk.Date != null && _tsk.Date != default(DateTime))
                {
                    WhereClause += $" AND Date = '{_tsk.Date.Value.ToString("yyyy-MM-dd")}'";
                }*/



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
