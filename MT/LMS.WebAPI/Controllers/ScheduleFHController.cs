using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ScheduleFHController : Controller
    {
        // GET: ScheduleFHController
        #region Class Variables

        private ScheduleFHService _schSVC;

        #endregion
        #region Constructors
        public ScheduleFHController()
        {
            _schSVC = new ScheduleFHService();
        }

        #endregion

        #region Http Verbs

        [HttpPost("{Search}")]
        public IActionResult SearchScheduleFH(ScheduleFHDE schedule)
        {
            List<ScheduleFHDE> list = _schSVC.SearchScheduleFH(schedule);
            return Ok(list);
        }
        [HttpGet]

        public IActionResult GetScheduleFH()
        {
            ScheduleFHDE schSC = new ScheduleFHDE();
            List<ScheduleFHDE> schedule = _schSVC.SearchScheduleFH(schSC);
            return Ok(schedule);
        }


        // POST api/<StudentController>
        [HttpPost]
        public IActionResult PostScheduleFH(ScheduleFHDE Schedule)
        {
            Schedule.DBoperation = LMS.Core.Enums.DBoperations.Insert;
            bool sch = _schSVC.ManageScheduleFH(Schedule);
            return Ok(sch);
        }


        // PUT api/<StudentController>/5
        [HttpPut]
        public IActionResult PutScheduleFH(ScheduleFHDE Schedule)
        {
            Schedule.DBoperation = DBoperations.Update;
            _schSVC.ManageScheduleFH(Schedule);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteScheduleFH(int id)
        {
            ScheduleFHDE Schedule = new ScheduleFHDE();
            Schedule.DBoperation = DBoperations.Delete;
            Schedule.Id = id;
            _schSVC.ManageScheduleFH(Schedule);
            return Ok();
        }
    }
    #endregion
}
