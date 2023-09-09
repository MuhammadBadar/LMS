using MySql.Data.MySqlClient;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Service
{
    public class AttendanceService
    {
        #region Class Members/Class Variables

        private AttendanceDAL _attndDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public AttendanceService()
        {
            _attndDAL = new AttendanceDAL();
            _corDAL = new CoreDAL();
        }


        #endregion
        #region Attendance
        public bool ManagementAttendance(AttendanceDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.attendance.ToString());
                    check = _attndDAL.ManageAttendance(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _attndDAL.ManageAttendance(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _attndDAL.AlterAttendance(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _attndDAL.AlterAttendance(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _attndDAL.AlterAttendance(mod, mod.Id);
                }
                if (check == true)
                    mod.DBoperation = DBoperations.NA;


                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }


        }
        public List<AttendanceDE> SearchAttendances(AttendanceDE mod)
        {
            List<AttendanceDE> Attendance = new List<AttendanceDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.UserId != default)
                    whereClause += $" AND UserId  like ''" + mod.UserId + "''";
                if (mod.WorkingHours != default)
                    whereClause += $" AND WorkingHours like ''" + mod.WorkingHours + "''";
                if (mod.UserName != default)
                    whereClause += $" AND UserName like ''" + mod.UserName + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Attendance = _attndDAL.SearchAttendances(whereClause);

                #endregion


            }
            catch (Exception exp)
            {

                throw exp;

            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return Attendance;
        }
       

        #endregion
    }
}
