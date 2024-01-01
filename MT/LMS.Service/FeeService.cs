using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using MySql.Data.MySqlClient;
using NLog;
using System;
using System.Collections.Generic;

namespace LMS.Service
{
    public class FeeService
    {
        #region Class Members/Class Variables

        private readonly FeeDAL _feeDAL;
        private readonly FeeLineDAL _feeLineDAL;
        private readonly CoreDAL _corDAL;
        private readonly Logger _logger;

        #endregion

        #region Constructors

        public FeeService()
        {
            _feeDAL = new FeeDAL();
            _feeLineDAL = new FeeLineDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }

        #endregion

        #region Fee

        public bool ManageFee(FeeDE fee)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            MySqlTransaction transaction = null;

            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                transaction = cmd.Connection.BeginTransaction();

                if (fee.DBoperation == DBoperations.Insert)
                    fee.Id = _corDAL.GetnextId(TableNames.fee.ToString());

                // Insert data into fee table
                retVal = _feeDAL.ManageFee(fee, cmd);

                // Check if FeeLines are provided, if yes, insert data into feeline table
                if (fee.FeeLines != null && fee.FeeLines.Count > 0)
                {
                    foreach (var line in fee.FeeLines)
                    {
                        line.Id = _corDAL.GetnextId(TableNames.feeline.ToString());
                        line.FeeId = fee.Id; // Associate fee line with the main fee
                        line.DBoperation = DBoperations.Insert;
                        retVal = _feeLineDAL.ManageFeeLine(line, cmd);

                        if (!retVal)
                            break; // If one fee line fails, break out of the loop and roll back the transaction
                    }
                }

                if (retVal)
                {
                    transaction.Commit();
                    fee.DBoperation = DBoperations.NA;
                }
                else
                {
                    transaction.Rollback();
                }

                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex, "Error in ManageFee method");
                transaction?.Rollback();
                throw;
            }
            finally
            {
                if (cmd != null)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }


        public List<FeeDE> SearchFee(FeeDE fee)
        {
            List<FeeDE> fees = new List<FeeDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;

            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                #region Search

                string whereClause = " WHERE 1=1";
                if (fee.Id != default && fee.Id != 0)
                    whereClause += $" AND Id={fee.Id}";
                if (fee.StudentId != default)
                    whereClause += $" AND StudentId LIKE '{fee.StudentId}'";
                if (fee.FeeDate != default)
                    whereClause += $" AND FeeDate LIKE '{fee.FeeDate}'";
                if (fee.Amount != default)
                    whereClause += $" AND Amount LIKE '{fee.Amount}'";
                if (fee.Concession != default)
                    whereClause += $" AND Concession LIKE '{fee.Concession}'";
                if (fee.IsActive != default)
                    whereClause += $" AND IsActive ={fee.IsActive}";

                fees = _feeDAL.SearchFee(whereClause);

                #endregion
            }
            catch (Exception exp)
            {
                _logger.Error(exp, "Error in SearchFee method");
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }

            return fees;
        }

        #endregion
    }
}
