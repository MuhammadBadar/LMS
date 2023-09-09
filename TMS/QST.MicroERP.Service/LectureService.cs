using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
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
    public class LectureService
    {
        #region Class Members/Class Variables

        private LectureDAL _lecDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public LectureService()
        {
            _lecDAL = new LectureDAL();
            _corDAL = new CoreDAL();
        }

        #endregion
        #region Lecture
        public bool ManagementLecture(LectureDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = QAFastTrackDataContext.OpenMySqlConnection();
                QAFastTrackDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.lecture.ToString());
                    check = _lecDAL.ManageLecture(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _lecDAL.ManageLecture(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _lecDAL.AlterLecture(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _lecDAL.AlterLecture(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _lecDAL.AlterLecture(mod, mod.Id);
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
        public List<LectureDE> SearchLectures(LectureSearchCriteria mod)
        {
            List<LectureDE> Lecture = new List<LectureDE>();
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
                if (mod.LectureURL != default)
                    whereClause += $" AND LectureURL like ''" + mod.LectureURL + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Lecture = _lecDAL.SearchLecture(whereClause);

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
            return Lecture;
        }

        #endregion
    }
}
