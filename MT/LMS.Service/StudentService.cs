using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.DAL;
using LMS.Service;
using MySql.Data.MySqlClient;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Service
{
    public class StudentService
    {

        private StudentDAL _stdDAL;
        private CoreDAL _corDAL;
        private Logger _logger;


        public StudentService()
        {
            _stdDAL = new StudentDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }

        public bool ManageStudent(StudentDE _Student)
        {
            // class veriables/datamembers

            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = LMSDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                if (_Student.DBoperation == DBoperations.Insert)
                    _Student.Id = _corDAL.GetnextId(TableNames.Student.ToString());
                retVal = _stdDAL.ManageStudent(_Student, cmd);
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
        public List<StudentDE> SearchStudent(StudentDE _student)
        {
            // public List<TopicDE> SearchTopic(TopicDE _topic)
            {
                List<StudentDE> retVal = new List<StudentDE>();
                bool closeConnectionFlag = false;
                MySqlCommand? cmd = null;
                try
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                    string WhereClause = "Where 1=1";
                    if (_student.Id != default)
                        WhereClause += $" AND Id={_student.Id}";
                    if (_student.CityId != default && _student.CityId != 0)
                        WhereClause += $" AND CityId={_student.CityId}";
                    if (_student.City != default)
                        WhereClause += $" and City like ''" + _student.City + "''";
                    if (_student.TopicId != default && _student.TopicId != 0)
                        WhereClause += $" AND TopicId={_student.TopicId}";
                    if (_student.Topic != default)
                        WhereClause += $" and Topic like ''" + _student.Topic + "''";
                    if (_student.Name != default)
                        WhereClause += $" and Name like ''" + _student.Name + "''";
                    if (_student.Email != default)
                        WhereClause += $" and Email like ''" + _student.Email + "''";
                    if (_student.IsActive != default)
                        WhereClause += $" AND IsActive={_student.IsActive}";

                    retVal = _stdDAL.SearchStudent(WhereClause, cmd);
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

        }
    }
}
    


