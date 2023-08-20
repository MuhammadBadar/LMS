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
    public class UsertaskbydateService
    {
        #region Class Members/Class Variables

        private UsertaskbydateDAL tskDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public UsertaskbydateService()
        {
            tskDAL = new UsertaskbydateDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        public List<UsertaskbydateVM> SearchUsertaskbydate(UsertaskbydateVM mod)
        {
            List<UsertaskbydateVM> tsk = new List<UsertaskbydateVM>();
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
                tsk = tskDAL.SearchUsertaskbydate(whereClause);

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
