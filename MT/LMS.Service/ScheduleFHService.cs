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
    public class ScheduleFHService
    {
        private ScheduleFHDAL _schDAL;
        private CoreDAL _corDAL;
        private Logger _logger;


        public ScheduleFHService()
        {
            _schDAL = new ScheduleFHDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }

        public bool ManageScheduleFH(ScheduleFHDE _Sch)
        {
            // class veriables/datamembers

            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_Sch.DBoperation == DBoperations.Insert)
                    _Sch.Id = _corDAL.GetnextId(TableNames.ScheduleFH.ToString());
                retVal = _schDAL.ManageScheduleFH(_Sch, cmd);
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

        //public List<VocabularyDE> SearchVocabulary(VocabularySearchCriteria mod)
        //        public List<ScheduleFHDE> SearchScheduleFH(ScheduleFHDE _sch)
        //        {
        //            // public List<TopicDE> SearchTopic(TopicDE _topic)
        //            {
        //                List<ScheduleFHDE> retVal = new List<ScheduleFHDE>();
        //                bool closeConnectionFlag = false;
        //                MySqlCommand? cmd = null;
        //                try
        //                {
        //                    cmd = LMSDataContext.OpenMySqlConnection();
        //                    closeConnectionFlag = true;
        //                    string WhereClause = "Where 1=1";
        //                    if (_sch.Id != default)
        //                        WhereClause += $" AND Id={_sch.Id}";
        //                    if (_sch.UserId != default)
        //                        WhereClause += $" and UserId like ''" + _sch.UserId + "''";
        //                    if (_sch.User != default)
        //                        WhereClause += $" and User like ''" + _sch.User + "''";
        //                    if (_sch.RoleId != default)
        //                        WhereClause += $" and RoleId like ''" + _sch.RoleId + "''";
        //                    if (_sch.Role != default)
        //                        WhereClause += $" and Role like ''" + _sch.Role + "''";
        //                    if (_sch.EntityId != default && _sch.EntityId != 0)
        //                        WhereClause += $" AND EntityId={_sch.EntityId}";
        //                    if (_sch.Entity != default)
        //                        WhereClause += $" and Entity like ''" + _sch.Entity + "''";
        //                    if (_sch.ScheduleTypeId != default && _sch.ScheduleTypeId != 0)
        //                        WhereClause += $" AND ScheduleTypeId={_sch.ScheduleTypeId}";
        //                    if (_sch.ScheduleType != default)
        //                        WhereClause += $" and ScheduleType like ''" + _sch.ScheduleType + "''";
        //                    if (_sch.WorkingTypeId != default && _sch.WorkingTypeId != 0)
        //                        WhereClause += $" AND WorkingTypeId={_sch.WorkingTypeId}";
        //                    if (_sch.WorkingType != default)
        //                        WhereClause += $" and WorkingType like ''" + _sch.WorkingType + "''";
        //                    if (_sch.WorkingHours != default)
        //                        WhereClause += $" and WorkingHours like ''" + _sch.WorkingHours + "''";
        //                    if (_sch.IsActive != default)
        //                        WhereClause += $" AND IsActive={_sch.IsActive}";

        //                    retVal = _schDAL.SearchScheduleFH(WhereClause, cmd);
        //                    return retVal;
        //                }
        //                catch (Exception ex)
        //                {
        //                    _logger.Error(ex);
        //                    throw;
        //                }
        //                finally
        //                {
        //                    if (closeConnectionFlag)
        //                        LMSDataContext.CloseMySqlConnection(cmd);
        //                }
        //            }

        //        }
        //    }
        //}
        public List<ScheduleFHDE> SearchScheduleFH(ScheduleFHDE mod)
        {
            List<ScheduleFHDE> list = new List<ScheduleFHDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                //#region Search

                //string whereClause = " Where 1=1";
                //if (mod.I != default)
                //    whereClause += $" AND Id={mod.Id}";
                //if (mod.Name != default)
                //    whereClause += $" AND Name like ''" + mod.Name + "''";
                //if (mod.IsActive != default)
                //    whereClause += $" AND IsActive ={mod.IsActive}";
                //Feature = _featDAL.SearchFeatures(whereClause);

                //#endregion
                list = _schDAL.SearchScheduleFH("");



                LMSDataContext.EndTransaction(cmd);
            }
            catch (Exception exp)
            {
                LMSDataContext.CancelTransaction(cmd);
                throw exp;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
            return list;
        }
    }
}



