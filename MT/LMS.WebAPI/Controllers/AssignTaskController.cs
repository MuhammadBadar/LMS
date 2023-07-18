using LMS.Core;
using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AssignTaskController : ControllerBase
    {
        #region Class Variables
        private AssignTaskService _AssignTaskSVC;
        #endregion

        #region Constructor
        public AssignTaskController()
        {
            _AssignTaskSVC = new AssignTaskService();
        }
        #endregion

        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            AssignTaskDE assignTask = new AssignTaskDE();
            List<AssignTaskDE> values = _AssignTaskSVC.SearchAssignedTask(assignTask);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetProductById(int id)
        {
            AssignTaskDE assignTask = new AssignTaskDE { Id = id };
            var values = _AssignTaskSVC.SearchAssignedTask(assignTask);
            return Ok(values);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(AssignTaskDE assignTask)
        {
            //assignTask.IsActive = true;
            List<AssignTaskDE> values = _AssignTaskSVC.SearchAssignedTask(assignTask);
            return Ok(values);
        }
        [HttpPost]
        public ActionResult Post(AssignTaskDE mod)
        {
            mod.DBoperation = DBoperations.Insert;
            bool assignTask = _AssignTaskSVC.ManageAssignedTask(mod);
            return Ok(assignTask);
        }
        [HttpPut]
        public ActionResult Put(AssignTaskDE mod)
        {
            mod.DBoperation = DBoperations.Update;
            _AssignTaskSVC.ManageAssignedTask(mod);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            AssignTaskDE assignTask = new AssignTaskDE { Id = id, DBoperation = DBoperations.Delete };
            _AssignTaskSVC.ManageAssignedTask(assignTask);
        }


        #endregion
    }
}