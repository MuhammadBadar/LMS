using LMS.Core.ViewModel;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class TaskController : ControllerBase
    {
        #region Class Variables
        private TaskService taskSVC;
        #endregion
        #region Constructor
        public TaskController()
        {
            taskSVC = new TaskService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            TaskVM task = new TaskVM();
            List<TaskVM> values = taskSVC.SearchTask(task);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetTaskById(int id)
        {
            TaskVM task = new TaskVM { Id = id };
            var values = taskSVC.SearchTask(task);
            return Ok(values);
        }


        #endregion
    }
}
