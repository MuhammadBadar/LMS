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
    public class ClientService
    {
        #region Class Variables
        private ClientDAL _cltDAL;
        private CoreDAL _coreDAL;
        private Logger _logger;
        #endregion
        #region Constructor
        public ClientService()
        {
            _cltDAL = new ClientDAL();
            _coreDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region  Client
        public bool ManageClient(ClientDE _clt)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_clt.DBoperation == DBoperations.Insert)
                    _clt.Id = _coreDAL.GetnextId(TableNames.client.ToString());
                retVal = _cltDAL.ManageClient(_clt, cmd);
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
        public List<ClientDE> SearchClient(ClientDE _clt)
        {
            List<ClientDE> retVal = new List<ClientDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                string WhereClause = " Where 1=1";
                if (_clt.Id != default)
                    WhereClause += $" AND Id={_clt.Id}";
                if (_clt.ClientName != default)
                    WhereClause += $" and ClientName like ''" + _clt.ClientName + "''";
                if (_clt.Cnic != default)
                    WhereClause += $" and Cnic like ''" + _clt.Cnic + "''";
                if (_clt.Cell != default)
                    WhereClause += $" and Cell like ''" + _clt.Cell + "''";
                if (_clt.Address != default)
                    WhereClause += $" and Address like ''" + _clt.Address + "''";
                if (_clt.Email != default)
                    WhereClause += $" and Email like ''" + _clt.Email + "''";
                if (_clt.JoiningDate != default)
                    WhereClause += $" and JoiningDate like ''" + _clt.JoiningDate + "''";               
                if (_clt.IsActive != default && _clt.IsActive == true)
                    WhereClause += $" AND IsActive=1";


                retVal = _cltDAL.SearchClient(WhereClause, cmd);
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
