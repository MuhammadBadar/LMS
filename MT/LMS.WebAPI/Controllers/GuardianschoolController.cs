using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GuardianschoolController : ControllerBase
    {
        private GuardianschoolService _guardianschoolSvc;
        public GuardianschoolController()
        {
            _guardianschoolSvc = new GuardianschoolService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetGuardianschool()
        {
            List<GuardianschoolDE> list = new List<GuardianschoolDE>();
            list = _guardianschoolSvc.SearchGuardianschool(new GuardianschoolDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchGuardianschool(GuardianschoolDE guardianschool)
        {
            List<GuardianschoolDE> list = _guardianschoolSvc.SearchGuardianschool(guardianschool);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetGuardianschoolById(int id)
        {
            List<GuardianschoolDE> list = new List<GuardianschoolDE>();
            list = _guardianschoolSvc.SearchGuardianschool(new GuardianschoolDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostGuardianschool(GuardianschoolDE guardianschool)
        {
            guardianschool.DBoperation = DBoperations.Insert;
            _guardianschoolSvc.ManageGuardianschool(guardianschool);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutGuardianschool(GuardianschoolDE guardianschool)
        {
            guardianschool.DBoperation = DBoperations.Update;
            _guardianschoolSvc.ManageGuardianschool(guardianschool);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteGuardianschool(int id)
        {
            GuardianschoolDE guardianschoolDe = new GuardianschoolDE();
            guardianschoolDe.DBoperation = DBoperations.Delete;
            guardianschoolDe.Id = id;
            _guardianschoolSvc.ManageGuardianschool(guardianschoolDe);
            return Ok();
        }
    }
}
