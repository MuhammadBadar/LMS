using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ScheduleController : ControllerBase
    {
        #region Class Variables
        private ScheduleService _ScheduleSVC;
        #endregion
        #region Constructor
        public ScheduleController()
        {
            _ScheduleSVC = new ScheduleService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            ScheduleDE Schedule = new ScheduleDE ();
            List<ScheduleDE> values = _ScheduleSVC.SearchSchedules(Schedule);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetScheduleById(int id)
        {
            ScheduleDE Schedule = new ScheduleDE { Id = id };
            var values = _ScheduleSVC.SearchSchedules(Schedule);
            return Ok(values);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(ScheduleDE Search)
        {
          /*  Search.IsActive = true*/;
            List<ScheduleDE> values = _ScheduleSVC.SearchSchedules(Search);
            return Ok(values);
        }
        [HttpPost]
        public ActionResult Post(ScheduleDE mod)
        {
            mod.DBoperation = DBoperations.Insert;
            ScheduleDE Schedule = _ScheduleSVC.ManagementSchedule(mod);
            return Ok(Schedule);
        }
        [HttpPut]
        public ActionResult Put(ScheduleDE mod)
        {
            mod.DBoperation = DBoperations.Update;
            ScheduleDE Schedule = _ScheduleSVC.ManagementSchedule(mod);
            return Ok(Schedule);
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            ScheduleDE Schedule = new ScheduleDE { Id = id, DBoperation = DBoperations.Delete };
            _ScheduleSVC.ManagementSchedule(Schedule);
        }

        #endregion
    }
}
