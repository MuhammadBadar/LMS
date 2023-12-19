using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SchoolController : ControllerBase
    {
        private SchoolService _schoolSvc;
        public SchoolController()
        {
            _schoolSvc = new SchoolService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetSchool()
        {
            List<SchoolDE> list = new List<SchoolDE>();
            list = _schoolSvc.SearchSchool(new SchoolDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchSchool(SchoolDE school)
        {
            List<SchoolDE> list = _schoolSvc.SearchSchool(school);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetSchoolById(int id)
        {
            List<SchoolDE> list = new List<SchoolDE>();
            list = _schoolSvc.SearchSchool(new SchoolDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostSchool(SchoolDE school)
        {
            school.DBoperation = DBoperations.Insert;
            _schoolSvc.ManageSchool(school);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutSchool(SchoolDE school)
        {
            school.DBoperation = DBoperations.Update;
            _schoolSvc.ManageSchool(school);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteSchool(int id)
        {
            SchoolDE schoolDe = new SchoolDE();
            schoolDe.DBoperation = DBoperations.Delete;
            schoolDe.Id = id;
            _schoolSvc.ManageSchool(schoolDe);
            return Ok();
        }
    }
}
