using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.DAL
{
    public class CityStudentDAL
    {
        #region DbOperations
        public bool ManageCityStudent(CityStudentDE _ctystd, MySqlCommand? cmd)
        {
            bool closeConnection = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                cmd.CommandText = "ManageCityStudent";
                cmd.Parameters.AddWithValue("id", _ctystd.Id);
                cmd.Parameters.AddWithValue("cityId", _ctystd.CityId);
                cmd.Parameters.AddWithValue("studentId", _ctystd.StudentId);
                cmd.Parameters.AddWithValue("createdOn", _ctystd.CreatedOn);
                cmd.Parameters.AddWithValue("createdBy", _ctystd.CreatedById);
                cmd.Parameters.AddWithValue("modifiedOn", _ctystd.ModifiedOn);
                cmd.Parameters.AddWithValue("modifiedBy", _ctystd.ModifiedById);
                cmd.Parameters.AddWithValue("isActive", _ctystd.IsActive);
                cmd.Parameters.AddWithValue("DbOperation", _ctystd.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (closeConnection)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<CityStudentDE> SearchCityStudent(string WhereClause, MySqlCommand cmd)
        {
            bool closeConnection = false;
            //WhereClause = string.Empty;
            List<CityStudentDE> lec = new List<CityStudentDE>();
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                lec = cmd.Connection.Query<CityStudentDE>("call lms.SearchCityStudent('" + WhereClause + "')").ToList();
                return lec;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnection)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        #endregion

    }
}
