using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class useraccountController : Controller
    {
        private useraccountService _patSvc;
        public useraccountController()
        {
            _patSvc = new useraccountService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult Getuseraccount()
        {
            List<useraccountDE> list = new List<useraccountDE>();
            list = _patSvc.SearchUserAccount(new useraccountDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchUserAccount(useraccountDE useraccount)
        {
            List<useraccountDE> list = _patSvc.SearchUserAccount(useraccount);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetuseraccountId(int id)
        {
            List<useraccountDE> list = new List<useraccountDE>();
            list = _patSvc.SearchUserAccount(new useraccountDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult Postuseraccount(useraccountDE useraccount)
        {
            useraccount.DBoperation = DBoperations.Insert;
            _patSvc.ManageUserAccount(useraccount);
            return Ok();
        }

        [HttpPut]
        public IActionResult Putuseraccount(useraccountDE useraccount)
        {
            useraccount.DBoperation = DBoperations.Update;
            _patSvc.ManageUserAccount(useraccount);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Deleteuseraccount(int id)
        {
            useraccountDE patDE = new useraccountDE();
            patDE.DBoperation = DBoperations.Delete;
            patDE.Id = id;
            _patSvc.ManageUserAccount(patDE);
            return Ok();
        }
    }
}
