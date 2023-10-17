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
        [HttpGet("{id}")]
        public ActionResult GetScheduleById(int id)
        {
            ScheduleDE Schedule;
            //var schedules = _schSVC.SearchSchedule(Schedule);
            return Ok();
        }

        /*[HttpGet("GetScheduleByUserId")]
        public ActionResult GetScheduleByUserId(string userId)
        {
            ScheduleDE Schedule = new ScheduleDE { UserId = userId };
            var schedules = _schSVC.SearchSchedule(Schedule); 
            var recentSchedule = schedules.LastOrDefault();
            return Ok(recentSchedule);
        }*/
        [HttpGet("GetScheduleByUserId")]
        public ActionResult GetScheduleByUserId(string userId)
        {
            //ScheduleDE Schedule = new ScheduleDE { UserId = userId };
            var schedule = _schSVC.GetScheduleByUserId(userId);

            return Ok(schedule);
        }

            [HttpGet]

        public IActionResult GetSchedule()
        {
            //ScheduleDE schSC = new ScheduleDE();
            //List<ScheduleDE> schedule = _schSVC.SearchSchedule(schSC);
            return Ok();
        }


        // POST api/<StudentController>
        [HttpPost]
        public IActionResult PostSchedule(ScheduleDE Schedule)
        {
            var existingSchedule = _schSVC.GetScheduleByUserId(Schedule.UserId);
            if(existingSchedule.Id == 0)
                Schedule.DBoperation = LMS.Core.Enums.DBoperations.Insert;
            else
                Schedule.DBoperation = LMS.Core.Enums.DBoperations.Update;
            ScheduleDE sch = _schSVC.ManageSchedule(Schedule);
            return Ok(sch);
        }


        // PUT api/<StudentController>/5
        [HttpPut]
        public IActionResult PutSchedule(ScheduleDE Schedule)
        {
            Schedule.DBoperation = DBoperations.Update;
            ScheduleDE sch = _schSVC.ManageSchedule(Schedule);
            return Ok(sch);
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteSchedule(int id)
        {
            ScheduleDE Schedule = new ScheduleDE();
            Schedule.DBoperation = DBoperations.Delete;
            Schedule.Id = id;
            ScheduleDE sch = _schSVC.ManageSchedule(Schedule);
            return Ok(sch);
        }
    }
    #endregion
}


//using LMS.Core.Entities;
//using LMS.Core.Enums;
//using LMS.Service;
//using Microsoft.AspNetCore.Http;
//using Microsoft.AspNetCore.Mvc;

//namespace LMS.WebAPI.Controllers
//{
//    [Route("api/[controller]")]
//    [ApiController]
//    public class ScheduleController : Controller
//    {
//        // GET: ScheduleFHController
//        #region Class Variables

//        private ScheduleService _schSVC;

//        #endregion
//        #region Constructors
//        public ScheduleController()
//        {
//            _schSVC = new ScheduleService();
//        }

//        #endregion

//        #region Http Verbs

//        [HttpPost("{Search}")]
//        public IActionResult SearchSchedule(ScheduleDE schedule)
//        {
//            List<ScheduleDE> list = _schSVC.SearchSchedule(schedule);
//            return Ok(list);
//        }
//        [HttpGet("{id}")]
//        public ActionResult GetScheduleById(int id)
//        {
//            ScheduleDE Schedule = new ScheduleDE { Id = id };
//            var values = _schSVC.SearchSchedule(Schedule);
//            return Ok(values);
//        }
//        [HttpGet]

//        public IActionResult GetSchedule()
//     {
//            ScheduleDE schSC = new ScheduleDE();
//            List<ScheduleDE> schedule = _schSVC.SearchSchedule(schSC);
//            return Ok(schedule);
//        }


//        // POST api/<StudentController>
//        [HttpPost]
//        public IActionResult PostSchedule(ScheduleDE Schedule)
//        {
//            Schedule.DBoperation = LMS.Core.Enums.DBoperations.Insert;
//            bool sch = _schSVC.ManageSchedule(Schedule);
//            return Ok(sch);
//        }


//        // PUT api/<StudentController>/5
//        [HttpPut]
//        public IActionResult PutSchedule(ScheduleDE Schedule)
//        {
//            Schedule.DBoperation = DBoperations.Update;
//            _schSVC.ManageSchedule(Schedule); 
//            return Ok();
//        }

//        [HttpDelete("{id}")]
//        public IActionResult DeleteSchedule(int id)
//        {
//            ScheduleDE Schedule = new ScheduleDE();
//            Schedule.DBoperation = DBoperations.Delete;
//            Schedule.Id = id;
//            _schSVC.ManageSchedule(Schedule);
//            return Ok();
//        }
//    }
//    #endregion
//}

