using Dapper;
using LMS.Core.Entities;
using MySql.Data.MySqlClient;
using System.Data;

namespace LMS.DAL
{
    public class AssignClassDAL
    {
        #region Operations
        public bool ManageAssignClass(AssignClassDE _assignClass, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "ManageAssignClass";
                cmd.Parameters.AddWithValue("@id", _assignClass.Id);
                cmd.Parameters.AddWithValue("@studentschoolId", _assignClass.StudentschoolId);
                cmd.Parameters.AddWithValue("@student", _assignClass.Student);
                cmd.Parameters.AddWithValue("@dateofassignment", _assignClass.Dateofassignment);
                cmd.Parameters.AddWithValue("@effectivedate", _assignClass.Effectivedate);
                cmd.Parameters.AddWithValue("@classId", _assignClass.ClassId);
                cmd.Parameters.AddWithValue("@sectionId", _assignClass.SectionId);
                cmd.Parameters.AddWithValue("@branchId", _assignClass.BranchId);
                cmd.Parameters.AddWithValue("@createdOn", _assignClass.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _assignClass.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _assignClass.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _assignClass.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _assignClass.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _assignClass.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<AssignClassDE> SearchAssignClass(string whereClause, MySqlCommand cmd = null)
        {
            List<AssignClassDE> top = new List<AssignClassDE>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = LMSDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                top = cmd.Connection.Query<AssignClassDE>("call lms.SearchAssignClass( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    LMSDataContext.CloseMySqlConnection(cmd);
            }
        }
        #endregion
    }
}
