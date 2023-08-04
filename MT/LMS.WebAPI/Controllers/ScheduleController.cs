using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ScheduleController : Controller
    {
        // GET: ScheduleFHController
        #region Class Variables

        private ScheduleService _schSVC;

        #endregion
        #region Constructors
        public ScheduleController()
        {
            _schSVC = new ScheduleService();
        }

        #endregion

        #region Http Verbs

        [HttpPost("{Search}")]
        public IActionResult SearchSchedule(ScheduleDE schedule)
        {
            List<ScheduleDE> list = _schSVC.SearchSchedule(schedule);
            return Ok(list);
        }
        [HttpGet]

        public IActionResult GetSchedule()
      {
            ScheduleDE schSC = new ScheduleDE();
            List<ScheduleDE> schedule = _schSVC.SearchSchedule(schSC);
            return Ok(schedule);
        }


        // POST api/<StudentController>
        [HttpPost]
        public IActionResult PostSchedule(ScheduleDE Schedule)
        {
            Schedule.DBoperation = LMS.Core.Enums.DBoperations.Insert;
            bool sch = _schSVC.ManageSchedule(Schedule);
            return Ok(sch);
        }


        // PUT api/<StudentController>/5
        [HttpPut]
        public IActionResult PutSchedule(ScheduleDE Schedule)
        {
            Schedule.DBoperation = DBoperations.Update;
            _schSVC.ManageSchedule(Schedule);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteSchedule(int id)
        {
            ScheduleDE Schedule = new ScheduleDE();
            Schedule.DBoperation = DBoperations.Delete;
            Schedule.Id = id;
            _schSVC.ManageSchedule(Schedule);
            return Ok();
        }
    }
    #endregion
}
