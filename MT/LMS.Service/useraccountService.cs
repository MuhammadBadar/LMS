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
    public class useraccountService
    {
        #region Class Variables
        private useraccountDAL _patDAL;
        private CoreDAL _coreDAL;
        private Logger _logger;
        #endregion
        #region Constructor
        public useraccountService()
        {
            _patDAL = new useraccountDAL();
            _coreDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region  useraccount
        public bool ManageUserAccount(useraccountDE _pat)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_pat.DBoperation == DBoperations.Insert)
                    _pat.Id = _coreDAL.GetnextId(TableNames.useraccount.ToString());
                retVal = _patDAL.ManageUserAccount(_pat, cmd);
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
        public List<useraccountDE> SearchUserAccount(useraccountDE _pat)
        {
            List<useraccountDE> retVal = new List<useraccountDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                string WhereClause = " Where 1=1";
                if (_pat.Id != default)
                    WhereClause += $" AND Id={_pat.Id}";
                if (_pat.UserName != default)
                    WhereClause += $" and UserName like ''" + _pat.UserName + "''";
                if (_pat.Cell != default)
                    WhereClause += $" and Cell like ''" + _pat.Cell + "''";
                if (_pat.Email != default)
                    WhereClause += $" and Email like ''" + _pat.Email + "''";
                if (_pat.Password != default)
                    WhereClause += $" and Password like ''" + _pat.Password + "''";
                if (_pat.RetypePassword != default)
                    WhereClause += $" and RetypePassword like ''" + _pat.RetypePassword + "''";
                if (_pat.IsActive != default && _pat.IsActive == true)
                    WhereClause += $" AND IsActive=1";


                retVal = _patDAL.SearchUserAccount(WhereClause, cmd);
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
