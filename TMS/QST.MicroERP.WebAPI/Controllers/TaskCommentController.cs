

using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using QST.MicroERP.Controllers;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
using QST.MicroERP.Core.ViewModel;
using QST.MicroERP.Services;
using QST.MicroERP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WepAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TaskCommentController : ControllerBase
    {
        
       

        #region Class Variables
        private TaskCommentService _taskCommentSVC;
        private UserManager<User> userManager;

        #endregion
        #region Constructors
        public TaskCommentController(UserManager<User> usrMgr
           )
        {
            userManager = usrMgr;
            _taskCommentSVC = new TaskCommentService();

        }

        #endregion
        #region Http Verbs

        [HttpGet ("{id}")]
        public ActionResult Get(int id)
        {
            TaskCommentSearchCriteria taskCommentSC = new TaskCommentSearchCriteria { TaskId=id};
            List<TaskCommentVM> TaskComment = _taskCommentSVC.SearchTaskComments(taskCommentSC);
            return Ok(TaskComment);
        }

        [HttpPost("{Search}")]
        public ActionResult Search(TaskCommentSearchCriteria Search)
        {
            List<TaskCommentVM> TaskComment = _taskCommentSVC.SearchTaskComments(Search);
            return Ok(TaskComment);
        }

        [HttpPost]
        public async Task<ActionResult> Post(TaskCommentDE taskComment)
        {
            //User user =await userManager.FindByNameAsync(taskComment.User);
            //taskComment.UserId=user.Id;
            taskComment.DBoperation = DBoperations.Insert;
            _taskCommentSVC.ManagementTaskComment(taskComment);
            return Ok(taskComment);
        }

        [HttpPut]
        public void Put(TaskCommentDE taskComment)
        {
            taskComment.DBoperation = DBoperations.Update;
            _taskCommentSVC.ManagementTaskComment(taskComment);
        }

        [HttpDelete]
        public void Delete(TaskCommentDE taskComment)
        {
            taskComment.DBoperation = DBoperations.Delete;
            _taskCommentSVC.ManagementTaskComment(taskComment);
        }

        #endregion

    }
   
}
