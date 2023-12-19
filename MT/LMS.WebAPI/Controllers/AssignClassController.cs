using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AssignClassController : ControllerBase
    {
        private AssignClassService _assignClassSvc;
        public AssignClassController()
        {
            _assignClassSvc = new AssignClassService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetAssignClass()
        {
            List<AssignClassDE> list = new List<AssignClassDE>();
            list = _assignClassSvc.SearchAssignClass(new AssignClassDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchAssignClass(AssignClassDE assignClass)
        {
            List<AssignClassDE> list = _assignClassSvc.SearchAssignClass(assignClass);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetAssignClassById(int id)
        {
            List<AssignClassDE> list = new List<AssignClassDE>();
            list = _assignClassSvc.SearchAssignClass(new AssignClassDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostAssignClass(AssignClassDE assignClass)
        {
            assignClass.DBoperation = DBoperations.Insert;
            _assignClassSvc.ManageAssignClass(assignClass);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutAssignClass(AssignClassDE assignClass)
        {
            assignClass.DBoperation = DBoperations.Update;
            _assignClassSvc.ManageAssignClass(assignClass);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteAssignClass(int id)
        {
            AssignClassDE assignClassDe = new AssignClassDE();
            assignClassDe.DBoperation = DBoperations.Delete;
            assignClassDe.Id = id;
            _assignClassSvc.ManageAssignClass(assignClassDe);
            return Ok();
        }
        [HttpGet("student/{studentschoolId}")]
        [HttpGet("student/{StudentschoolId}")]
        public IActionResult GetAssignClassByStudentschoolId(int StudentschoolId)
        {
            List<AssignClassDE> list = _assignClassSvc.SearchAssignClass(new AssignClassDE { StudentschoolId = StudentschoolId });
            if (list.Count == 0)
            {
                return NotFound();
            }
            return Ok(list[0]);
        }
    }
}
