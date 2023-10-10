using LMS.Core.ViewModel;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class TasksController : ControllerBase
    {
        #region Class Variables
        private TasksService taskSVC;
        #endregion
        #region Constructor
        public TasksController()
        {
            taskSVC = new TasksService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            TasksVM task = new TasksVM();
            List<TasksVM> values = taskSVC.SearchTasks(task);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetTaskById(int id)
        {
            TasksVM task = new TasksVM { Id = id };
            var values = taskSVC.SearchTasks(task);
            return Ok(values);
        }


        #endregion
    }
}
