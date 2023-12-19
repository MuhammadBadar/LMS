using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentschoolController : ControllerBase
    {
        private StudentschoolService _studentschoolSvc;
        public StudentschoolController()
        {
            _studentschoolSvc = new StudentschoolService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetStudentschool()
        {
            List<StudentschoolDE> list = new List<StudentschoolDE>();
            list = _studentschoolSvc.SearchStudentschool(new StudentschoolDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchStudentschool(StudentschoolDE studentschool)
        {
            List<StudentschoolDE> list = _studentschoolSvc.SearchStudentschool(studentschool);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetSchoolById(int id)
        {
            List<StudentschoolDE> list = new List<StudentschoolDE>();
            list = _studentschoolSvc.SearchStudentschool(new StudentschoolDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostStudentschool(StudentschoolDE studentschool)
        {
            studentschool.DBoperation = DBoperations.Insert;
            _studentschoolSvc.ManageStudentschool(studentschool);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutStudentschool(StudentschoolDE studentschool)
        {
            studentschool.DBoperation = DBoperations.Update;
            _studentschoolSvc.ManageStudentschool(studentschool);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteStudentschool(int id)
        {
            StudentschoolDE studentschoolDe = new StudentschoolDE();
            studentschoolDe.DBoperation = DBoperations.Delete;
            studentschoolDe.Id = id;
            _studentschoolSvc.ManageStudentschool(studentschoolDe);
            return Ok();
        }
    }
}
