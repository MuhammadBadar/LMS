using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Entities.Security;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
using QST.MicroERP.Core.ViewModel;
using QST.MicroERP.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Services
{
    public class StudentService
    {
        #region Class Members/Class Variables

        private StudentDAL _stdDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public StudentService()
        {
            _stdDAL = new StudentDAL();
            _corDAL = new CoreDAL();
        }

        #endregion
        #region Student
        public bool ManagementStudent(StudentDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    #region Insert User

                    
                    //UserDAL usDal = new UserDAL();
                    //UserDE user = new UserDE();
                    //user.DBoperation = DBoperations.Insert;
                    //user.Id = _corDAL.GetnextId(TableNames.user.ToString());
                    //user.UserName = mod.UserName;
                    //user.Password = mod.Password;                    
                    //check = usDal.ManageUser(user);

                    #endregion

                    mod.Id = _corDAL.GetnextId(TableNames.student.ToString());
                    check = _stdDAL.ManageStudent(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _stdDAL.ManageStudent(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _stdDAL.AlterStudent(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _stdDAL.AlterStudent(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _stdDAL.AlterStudent(mod, mod.Id);
                }
                if (check == true)
                    mod.DBoperation = DBoperations.NA;

                QAFastTrackDataContext.EndTransaction(cmd);
            }
            catch
            {
                QAFastTrackDataContext.CancelTransaction(cmd);
            }
            finally
            {
                if (cmd != null)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
            return true;

        }
        public List<StudentDE> SearchStudents(StudentSearchCriteria mod)
        {
            List<StudentDE> Student = new List<StudentDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.StudentName != default)
                    whereClause += $" AND StudentName like ''" + mod.StudentName + "''";
                if (mod.Password != default)
                    whereClause += $" AND Password like ''" + mod.Password + "''";
                if (mod.UserName != default)
                    whereClause += $" AND UserName like ''" + mod.UserName + "''";
                if (mod.CellNo != default)
                    whereClause += $" AND CellNo like ''" + mod.CellNo + "''";
                if (mod.Email != default)
                    whereClause += $" AND Email like ''" + mod.Email + "''";
                if (mod.CNIC != default)
                    whereClause += $" AND CNIC like ''" + mod.CNIC + "''";
                if (mod.GuardianName != default)
                    whereClause += $" AND GuardianName like ''" + mod.GuardianName + "''";
                if (mod.GuardianCell != default)
                    whereClause += $" AND GuardianCell like ''" + mod.GuardianCell + "''";
                if (mod.GuardianWhatsApp != default)
                    whereClause += $" AND GuardianWhatsApp like ''" + mod.GuardianWhatsApp + "''";
                if (mod.GuardianEmail != default)
                    whereClause += $" AND GuardianEmail like ''" + mod.GuardianEmail + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Student = _stdDAL.SearchStudent(whereClause);

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
            return Student;
        }

        #endregion
    }
}
