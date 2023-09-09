using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
using QST.MicroERP.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Services
{
    public class StudentLectureService
    {
        #region Class Members/Class Variables

        private StudentLecturesDAL _lecDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public StudentLectureService()
        {
            _lecDAL = new StudentLecturesDAL();
            _corDAL = new CoreDAL();
        }

        #endregion
        #region StudentLecture
        public bool ManagementStudentLecture(StudentLecturesDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.studentlecture.ToString());
                    check = _lecDAL.ManageStudentLecture(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _lecDAL.ManageStudentLecture(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _lecDAL.AlterStudentLecture(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _lecDAL.AlterStudentLecture(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _lecDAL.AlterStudentLecture(mod, mod.Id);
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
        public List<StudentLecturesDE> SearchStudentLectures(StudentLectureSearchCriteria mod)
        {
            List<StudentLecturesDE> stdl = new List<StudentLecturesDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = QAFastTrackDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.Title != default)
                    whereClause += $" AND Title like ''" + mod.Title + "''";
                if (mod.Student != default)
                    whereClause += $" AND Student like ''" + mod.Student + "''";
                if (mod.UserName != default)
                    whereClause += $" AND UserName like ''" + mod.UserName + "''";
                if (mod.Password != default)
                    whereClause += $" AND Password like ''" + mod.Password + "''";
                if (mod.StudentId != default)
                    whereClause += $" AND StudentId={mod.StudentId}";
                if (mod.LectureId != default)
                    whereClause += $" AND LectureId={mod.LectureId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                stdl = _lecDAL.SearchStudentLecture(whereClause);

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
            return stdl;
        }

        #endregion
    }
}
