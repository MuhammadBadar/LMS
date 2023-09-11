using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SchController : Controller
    {
        // GET: ScheduleFHController
        #region Class Variables

        private SchService _schSVC;

        #endregion
        #region Constructors
        public SchController()
        {
            _schSVC = new SchService();
        }

        #endregion

        #region Http Verbs

        [HttpPost("{Search}")]
        public IActionResult SearchSch(SchDE sch)
        {
            List<SchDE> list = _schSVC.SearchSch(sch);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetSchById(int id)
        {
            SchDE Sch = new SchDE { Id = id };
            var values = _schSVC.SearchSch(Sch);
            return Ok(values);
        }
        [HttpGet]

        public IActionResult GetSch()
        {
            SchDE schSC = new SchDE();
            List<SchDE> sch = _schSVC.SearchSch(schSC);
            return Ok(sch);
        }


        // POST api/<StudentController>
        [HttpPost]
        public IActionResult PostSch(SchDE Sch)
        {

            Sch.DBoperation = DBoperations.Insert;
            SchDE sch = _schSVC.ManageSch(Sch);
            return Ok(sch);
        }


        // PUT api/<StudentController>/5
        [HttpPut]
        public IActionResult PutSch(SchDE Sch)
        {
            Sch.DBoperation = DBoperations.Update;
            SchDE sch = _schSVC.ManageSch(Sch);
            return Ok(sch);
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteSch(int id)
        {
            SchDE Sch = new SchDE();
            Sch.DBoperation = DBoperations.Delete;
            Sch.Id = id;
            SchDE sch = _schSVC.ManageSch(Sch);
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

