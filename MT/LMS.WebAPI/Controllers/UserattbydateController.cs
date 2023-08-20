using LMS.Core.ViewModel;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserattbydateController : ControllerBase
    {
        #region Class Variables
        private UserattbydateService attSVC;
        #endregion
        #region Constructor
        public UserattbydateController()
        {
            attSVC = new UserattbydateService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            UserattbydateVM Att = new UserattbydateVM();
            List<UserattbydateVM> values = attSVC.SearchUserattbydate(Att);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetUserattbydateById(int id)
        {
            UserattbydateVM att = new UserattbydateVM { Id = id };
            var values = attSVC.SearchUserattbydate(att);
            return Ok(values);
        }


        #endregion
    }

}
