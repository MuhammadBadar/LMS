using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserTaskController : ControllerBase
    {
            private UserTaskService _tskSvc;
            public UserTaskController()
            {
            _tskSvc = new UserTaskService();
            }
        // HTTP Methods 
        [HttpGet]
        public ActionResult Get()
        {
            UserTaskDE usr = new UserTaskDE();
            List<UserTaskDE> values = _tskSvc.Searchusertask(usr);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public IActionResult GetusertaskById(int id)
        {
            List<UserTaskDE> list = new List<UserTaskDE>();
            list = _tskSvc.Searchusertask(new UserTaskDE { Id = id });
            return Ok(list[0]);

        }

        //[HttpPost("{Search}")]
        //public ActionResult Search(UserTaskDE usr)
        //{
        //    //assignTask.IsActive = true;
        //    List<UserTaskDE> values = _tskSvc.Searchusertask(usr);
        //    return Ok(values);
        //}
        [HttpPost]
        public ActionResult Post(List<UserTaskDE> mod)
        {
            foreach(var item in mod)
                item.DBoperation = DBoperations.Insert;
            bool usr = _tskSvc.Manageusertask(mod);
            return Ok(usr);
        }
        [HttpPut]
        public ActionResult Put(UserTaskDE mod)
        {
            mod.DBoperation = DBoperations.Update;
            //_tskSvc.Manageusertask(mod);
            return Ok();
        }
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //    UserTaskDE usr = new UserTaskDE { Id = id, DBoperation = DBoperations.Delete };
        //    _tskSvc.Manageusertask(usr);
        //}
    }
}
