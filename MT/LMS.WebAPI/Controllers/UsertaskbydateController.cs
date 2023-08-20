using LMS.Core.ViewModel;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class UsertaskbydateController : ControllerBase
    {
        #region Class Variables
        private UsertaskbydateService taskSVC;
        #endregion
        #region Constructor
        public UsertaskbydateController()
        {
            taskSVC = new UsertaskbydateService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            UsertaskbydateVM task = new UsertaskbydateVM();
            List<UsertaskbydateVM> values = taskSVC.SearchUsertaskbydate(task);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetTaskById(int id)
        {
            UsertaskbydateVM task = new UsertaskbydateVM { Id = id };
            var values = taskSVC.SearchUsertaskbydate(task);
            return Ok(values);
        }


        #endregion
    }
}