using LMS.Core.ViewModel;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{

    [Route("api/[controller]")]
    [ApiController]

    public class UserreportController : Controller
    {

        #region Class Variables
        private UserreportService usrSVC;
        #endregion
        #region Constructor
        public UserreportController()
        {
            usrSVC = new UserreportService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            UserreportVM task = new UserreportVM();
            List<UserreportVM> values = usrSVC.SearchUserreport(task);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetUserreportById(int id)
        {
            UserreportVM task = new UserreportVM { Id = id };
            var values = usrSVC.SearchUserreport(task);
            return Ok(values);
        }


        #endregion
    }
}

