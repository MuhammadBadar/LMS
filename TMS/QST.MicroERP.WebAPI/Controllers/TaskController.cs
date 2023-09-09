

using Microsoft.AspNetCore.Mvc;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
using QST.MicroERP.Core.ViewModel;
using QST.MicroERP.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WepAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TaskController : ControllerBase
    {

        #region Class Variables

        private TaskService _taskSVC;

        #endregion
        #region Constructors
        public TaskController()
        {
            _taskSVC = new TaskService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
           
            TaskSearchCriteria TaskSC = new TaskSearchCriteria { IsActive = true };
            List<TaskVM> task = _taskSVC.SearchTasks(TaskSC);
            return Ok(task);
        }
        [HttpGet("{id}")]
        public ActionResult GetTaskById(int id)
        {

            TaskSearchCriteria tasktSC = new TaskSearchCriteria { Id = id };
            var tsk = _taskSVC.SearchTasks(tasktSC);
            return Ok(tsk);
        }

        [HttpPost("{Search}")]
        public ActionResult Search(TaskSearchCriteria Search)
        {
            List<TaskVM> cust = _taskSVC.SearchTasks(Search);
            return Ok(cust);
        }

        [HttpPost]
        public ActionResult Post(TaskDE task)
        {
            task.DBoperation = DBoperations.Insert;
            var retVal = _taskSVC.ManagementTask(task);
            //retVal.HasErrors = true;

            return (Ok(retVal));

            //if (task.Id != 0)
            //{
            //    //TaskSearchCriteria tasktSC = new TaskSearchCriteria { Id = task.Id };
            //    //var data = _taskSVC.SearchTasks(tasktSC);
            //    //return (Ok(data));
            //}
            //else
            //{
            //    return Ok(null);
            //}

        }

        [HttpPut]
        public void Put(TaskDE task)
        {

            task.DBoperation = DBoperations.Update;
            _taskSVC.ManagementTask(task);
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            TaskDE task = new TaskDE { Id = id, DBoperation = DBoperations.DeActivate };
            _taskSVC.ManagementTask(task);
        }

        #endregion
       

    }
}
