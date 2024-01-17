using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FeeLineController : ControllerBase
    {
        private FeeLineService _feeLineSvc;
        public FeeLineController()
        {
            _feeLineSvc = new FeeLineService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetFeeLine()
        {
            List<FeeLineDE> list = new List<FeeLineDE>();
            list = _feeLineSvc.SearchFeeLine(new FeeLineDE());
            return Ok(list);
        }


        [HttpGet]
        [Route("GetFeeLine/{feeId}")]
        public IActionResult GetFeeLine(int feeId)
        {
            try
            {
                List<FeeLineDE> list = _feeLineSvc.GetFeeLinesByFeeId(feeId);
                return Ok(list);
            }
            catch (Exception ex)
            {
                // Log the exception or handle it accordingly
                return StatusCode(500, "Internal Server Error");
            }
        }


        [HttpPost("{Search}")]
        public IActionResult SearchFeeLine(FeeLineDE feeLine)
        {
            List<FeeLineDE> list = _feeLineSvc.SearchFeeLine(feeLine);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetFeeById(int id)
        {
            List<FeeLineDE> list = new List<FeeLineDE>();
            list = _feeLineSvc.SearchFeeLine(new FeeLineDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostFee(FeeLineDE feeLine)
        {
            feeLine.DBoperation = DBoperations.Insert;
            _feeLineSvc.ManageFeeLine(feeLine);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutFee(FeeLineDE feeLine)
        {
            feeLine.DBoperation = DBoperations.Update;
            _feeLineSvc.ManageFeeLine(feeLine);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            FeeLineDE feeLine = new FeeLineDE();
            feeLine.DBoperation = DBoperations.Delete;
            feeLine.Id = id;
            _feeLineSvc.ManageFeeLine(feeLine);
            return Ok();
        }
    }
}
