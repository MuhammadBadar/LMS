using LMS.Core.Entities;
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
    public class AttendanceService
    {
        #region Class Members/Class Variables

        private AttendanceDAL attDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public AttendanceService()
        {
            attDAL = new AttendanceDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        public List<AttendanceVM> SearchAttendance(AttendanceVM mod)
        {
            List<AttendanceVM> att = new List<AttendanceVM>();
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
                att = attDAL.SearchAttendance(whereClause);

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
