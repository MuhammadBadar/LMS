using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BranchschoolController : ControllerBase
    {
        private BranchschoolService _branchschoolSvc;
        public BranchschoolController()
        {
            _branchschoolSvc = new BranchschoolService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetBranchschool()
        {
            List<BranchschoolDE> list = new List<BranchschoolDE>();
            list = _branchschoolSvc.SearchBranchschool(new BranchschoolDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchBranchschool(BranchschoolDE branchschool)
        {
            List<BranchschoolDE> list = _branchschoolSvc.SearchBranchschool(branchschool);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetBranchschoolById(int id)
        {
            List<BranchschoolDE> list = new List<BranchschoolDE>();
            list = _branchschoolSvc.SearchBranchschool(new BranchschoolDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostBranchschool(BranchschoolDE branchschool)
        {
            branchschool.DBoperation = DBoperations.Insert;
            _branchschoolSvc.ManageBranchschool(branchschool);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutBranchschool(BranchschoolDE branchschool)
        {
            branchschool.DBoperation = DBoperations.Update;
            _branchschoolSvc.ManageBranchschool(branchschool);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteBranchschool(int id)
        {
            BranchschoolDE branchschoolDe = new BranchschoolDE();
            branchschoolDe.DBoperation = DBoperations.Delete;
            branchschoolDe.Id = id;
            _branchschoolSvc.ManageBranchschool(branchschoolDe);
            return Ok();
        }
    }
}
