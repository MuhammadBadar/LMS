using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        #region Class Variables
        private UserService _UserSVC;
        #endregion
        #region Constructor
        public UserController()
        {
            _UserSVC = new UserService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            UserDE User = new UserDE { IsActive = true };
            List<UserDE> values = _UserSVC.SearchUsers(User);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetUserById(int id)
        {
            UserDE User = new UserDE { Id = id };
            var values = _UserSVC.SearchUsers(User);
            return Ok(values);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(UserDE Search)
        {
            Search.IsActive = true;
            List<UserDE> values = _UserSVC.SearchUsers(Search);
            return Ok(values);
        }
        [HttpPost("{search}/{user}")]
        public ActionResult SearchUser(UserDE user)
        {
            user.IsActive = true;
            List<UserDE> values = _UserSVC.SearchUsers(user);
            if (values.Count > 0)
                return Ok(true);
             else
                return Ok(false);
        }
        [HttpPost]
        public ActionResult Post(UserDE mod)
        {
            mod.DBoperation = DBoperations.Insert;
            bool User = _UserSVC.ManagementUser(mod);
            return Ok(User);
        }
        [HttpPut]
        public ActionResult Put(UserDE mod)
        {
            mod.DBoperation = DBoperations.Update;
            _UserSVC.ManagementUser(mod);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            UserDE User = new UserDE { Id = id, DBoperation = DBoperations.Delete };
            _UserSVC.ManagementUser(User);
        }

        #endregion
    }
}
