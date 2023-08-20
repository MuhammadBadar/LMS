using LMS.Core.ViewModel;
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
    public class TaskService
    {
        #region Class Members/Class Variables

        private TaskDAL tskDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public TaskService()
        {
            tskDAL = new TaskDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        public List<TaskVM> SearchTask(TaskVM mod)
        {
            List<TaskVM> tsk = new List<TaskVM>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                tsk = tskDAL.SearchTask(whereClause);

                #endregion
            }
            catch (Exception exp)
            {
                _logger.Error(exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return tsk;
        }

    }
}
