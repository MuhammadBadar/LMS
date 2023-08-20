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
    public class UserattbydateService
    {
        #region Class Members/Class Variables

        private UserattbydateDAL attDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public UserattbydateService()
        {
            attDAL = new UserattbydateDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        public List<UserattbydateVM> SearchUserattbydate(UserattbydateVM mod)
        {
            List<UserattbydateVM> att = new List<UserattbydateVM>();
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
                att = attDAL.SearchUserattbydate(whereClause);

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
            return att;
        }

    }
}
