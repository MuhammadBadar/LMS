using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QST.MicroERP.Core.ViewModel;
using System.IO;
using System.Net.Http.Headers;
using QST.MicroERP.Core.Entities;

namespace QST.MicroERP.DAL
{
   public class TaskDAL
    {
        
        #region Operations

        public bool ManageTask(TaskDE task, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "Managetask";
                cmd.Parameters.AddWithValue("@id", task.Id);
                cmd.Parameters.AddWithValue("@userId", task.UserId);
                cmd.Parameters.AddWithValue("@moduleId", task.ModuleId);
                cmd.Parameters.AddWithValue("@statusId", task.StatusId);
                cmd.Parameters.AddWithValue("@priorityId", task.PriorityId);
                cmd.Parameters.AddWithValue("@title", task.Title);
                cmd.Parameters.AddWithValue("@sp", task.SP);
                cmd.Parameters.AddWithValue("@description", task.Description);
                cmd.Parameters.AddWithValue("@createdOn", task.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", task.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", task.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", task.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", task.IsActive);
                cmd.Parameters.AddWithValue("@filter", task.DBoperation.ToString());

                cmd.ExecuteNonQuery();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        public bool ManageAttachments(AttachmentsDE atchmnt, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");

                

                cmd.CommandText = "ManageAttachments";
                cmd.Parameters.AddWithValue("@id", atchmnt.Id);
                cmd.Parameters.AddWithValue("@taskId", atchmnt.TaskId);
                cmd.Parameters.AddWithValue("@name", atchmnt.Name);
                cmd.Parameters.AddWithValue("@size", atchmnt.Size);
                cmd.Parameters.AddWithValue("@docPath", atchmnt.DocPath);
                cmd.Parameters.AddWithValue("@base64File", atchmnt.Base64File);
                cmd.Parameters.AddWithValue("@createdOn", atchmnt.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", atchmnt.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", atchmnt.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", atchmnt.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", atchmnt.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", atchmnt.DBoperation.ToString());

                cmd.ExecuteNonQuery();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        public bool AlterTask(TaskDE task,  MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");

                cmd.CommandText = "AlterTasks";
                cmd.Parameters.AddWithValue("@id", task.Id);
                cmd.Parameters.AddWithValue("@filter", task.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception exp)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        public bool AlterAttachments(AttachmentsDE atchmnt, int? Id = null, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");

                //if(!Directory.Exists(AppDirectory))
                //Directory.CreateDirectory(AppDirectory);
                //var FileName = DateTime.Now.Ticks.ToString() + Path.GetExtension(atchmnt.Name);
                //var path = Path.Combine(AppDirectory, FileName);



                //string fileName = atchmnt.Name;
                //FileInfo f = new FileInfo(fileName);
                //string fullname = f.FullName;

                //string currentDirectory = Directory.GetCurrentDirectory();
                //string[] fullFilePath = Directory.GetFiles(currentDirectory, fileName, SearchOption.AllDirectories);

                cmd.CommandText = "AlterAttachments";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@filter", atchmnt.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception exp)
            {
                return false;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<AttachmentsDE> SearchAttachments(string whereClause, MySqlCommand cmd = null)
        {
            // string filter = "FreeSearch";
            List<AttachmentsDE> top = new List<AttachmentsDE>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");

                top = cmd.Connection.Query<AttachmentsDE>("call mrcroerp.SearchAttachments( '" + whereClause + "'  ) ").ToList();
                return top;
            }
            catch (Exception exp)
            {
                return top;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<TaskVM> SearchTasks(string whereClause, MySqlCommand cmd = null)
        {
            // string filter = "FreeSearch";
            List<TaskVM> top = new List<TaskVM>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = QAFastTrackDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection has been created");
                else
                    Console.WriteLine("Connection error");

                //top = cmd.Connection.Query<TaskVM>("call mrcroerp.SearchTasks( '" + whereClause + "'  ) ").ToList();
                whereClause = " " + whereClause + " order by Id desc";
                top = cmd.Connection.Query<TaskVM>("call microerp.SearchTasks( '" + whereClause + "'  ) ").ToList();
                return top;
            }
            catch (Exception exp)
            {
                return top;
            }
            finally
            {
                if (closeConnectionFlag)
                    QAFastTrackDataContext.CloseMySqlConnection(cmd);
            }
        }

        #endregion

    }
}
