using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FeetypeschoolController : ControllerBase
    {
        private FeetypeschoolService _feetypeschoolSvc;
        public FeetypeschoolController()
        {
            _feetypeschoolSvc = new FeetypeschoolService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetFeetypeschool()
        {
            List<FeetypeschoolDE> list = new List<FeetypeschoolDE>();
            list = _feetypeschoolSvc.SearchFeetypeschool(new FeetypeschoolDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchFeetypeschool(FeetypeschoolDE feetypeschool)
        {
            List<FeetypeschoolDE> list = _feetypeschoolSvc.SearchFeetypeschool(feetypeschool);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetFeetypeschoolById(int id)
        {
            List<FeetypeschoolDE> list = new List<FeetypeschoolDE>();
            list = _feetypeschoolSvc.SearchFeetypeschool(new FeetypeschoolDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostFeetypeschool(FeetypeschoolDE feetypeschool)
        {
            feetypeschool.DBoperation = DBoperations.Insert;
            _feetypeschoolSvc.ManageFeetypeschool(feetypeschool);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutFeetypeschool(FeetypeschoolDE feetypeschool)
        {
            feetypeschool.DBoperation = DBoperations.Update;
            _feetypeschoolSvc.ManageFeetypeschool(feetypeschool);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteFeetypeschool(int id)
        {
            FeetypeschoolDE feetypeschoolDe = new FeetypeschoolDE();
            feetypeschoolDe.DBoperation = DBoperations.Delete;
            feetypeschoolDe.Id = id;
            _feetypeschoolSvc.ManageFeetypeschool(feetypeschoolDe);
            return Ok();
        }
        [HttpGet("Titles")]
        public IActionResult GetFeetypeschoolTitles()
        {
            List<FeetypeschoolDE> list = _feetypeschoolSvc.SearchFeetypeschool(new FeetypeschoolDE());

            // Create a list of anonymous objects with both ID and Title
            var titlesWithIds = list.Select(f => new { Id = f.Id, Title = f.Title }).ToList();

            return Ok(titlesWithIds);
        }

    }
}
