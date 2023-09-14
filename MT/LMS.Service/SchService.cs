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
    public class SchService
    {

        private SchDAL _schDAL;
        private CoreDAL _corDAL;
        private Logger _logger;


        public SchService()
        {
            _schDAL = new SchDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }

        public SchDE ManageSch(SchDE mod)
        {
            // class veriables/datamembers

            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                LMSDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.sch.ToString());
                retVal = _schDAL.ManageSch(mod, cmd);
                //var id = _corDAL.GetnextLineId(TableNames.schLine.ToString(), mod.Id,"SchId");
                //  if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                //foreach (var line in mod.SchLine)
                //{
                //    line.SchId = mod.Id;
                //    line.DBoperation = DBoperations.Insert;
                //    if (line.DBoperation == DBoperations.Insert)
                //    {
                //        id +=1;
                //        line.Id =id;
                //        retVal = _schDAL.ManageSchLine(line, cmd);
                //    }
                //}
                if (mod.DayIds != null)
                {
                    foreach (var day in mod.DayIds)
                    {
                        var SchLine = new SchLineDE();
                        SchLine.DayId = day;
                        SchLine.SchId = mod.Id;
                        SchLine.DBoperation = DBoperations.Insert;
                        retVal = _schDAL.ManageSchLine(SchLine, cmd);
                    }
                }
                


                if (retVal == true)
                {
                    mod.DBoperation = DBoperations.NA;
                }
                LMSDataContext.EndTransaction(cmd);

            }
            catch (Exception ex)
            {
                LMSDataContext.CancelTransaction(cmd);
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
                string whereClause = " Where 1=1";
                mod.SchLine = _schDAL.SearchSchLine(whereClause += $" AND SchId={mod.Id} AND IsActive ={true}");
            }
            return mod;
        }
             public List<SchDE> SearchSch(SchDE mod)
        {
            List<SchDE> list = new List<SchDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                list = _schDAL.SearchSch(whereClause);
                foreach (var line in list)
                {
                    whereClause = "where 1=1";
                    line.SchLine = _schDAL.SearchSchLine(whereClause += $" AND SchId={line.Id} AND IsActive ={true}");
                }

                #endregion
            }
            catch (Exception exp)
            {
                
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