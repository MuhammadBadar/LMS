using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FeeController : ControllerBase
    {
        private FeeService _feeSvc;
        public FeeController()
        {
            _feeSvc = new FeeService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetFee()
        {
            List<FeeDE> list = new List<FeeDE>();
            list = _feeSvc.SearchFee(new FeeDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchFee(FeeDE fee)
        {
            List<FeeDE> list = _feeSvc.SearchFee(fee);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetFeeById(int id)
        {
            List<FeeDE> list = new List<FeeDE>();
            list = _feeSvc.SearchFee(new FeeDE { Id = id });
            return Ok(list[0]);

        }

        [HttpGet("GetStudentById")]
        public ActionResult GetStudentById(string userId)
        {
            //ScheduleDE Schedule = new ScheduleDE { UserId = userId };
            var fee = _feeSvc.GetStudentById(userId);

            return Ok(fee);
        }

        [HttpPost]
        public IActionResult PostFee(FeeDE fee)
        {
            fee.DBoperation = DBoperations.Insert;
            _feeSvc.ManageFee(fee);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutFee(FeeDE fee)
        {
            fee.DBoperation = DBoperations.Update;
            _feeSvc.ManageFee(fee);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            FeeDE fee = new FeeDE();
            fee.DBoperation = DBoperations.Delete;
            fee.Id = id;
            _feeSvc.ManageFee(fee);
            return Ok();
        }
    }
}
