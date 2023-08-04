using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseScheduleController : ControllerBase
    {
        #region Class Variables
        private CourseScheduleService _ScheduleSVC;
        #endregion
        #region Constructor
        public CourseScheduleController()
        {
            _ScheduleSVC = new CourseScheduleService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            CourseScheduleDE Schedule = new CourseScheduleDE ();
            List<CourseScheduleDE> values = _ScheduleSVC.SearchCourseSchedules(Schedule);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetCourseScheduleById(int id)
        {
            CourseScheduleDE Schedule = new CourseScheduleDE { Id = id };
            var values = _ScheduleSVC.SearchCourseSchedules(Schedule);
            return Ok(values);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(CourseScheduleDE Search)
        {
          /*  Search.IsActive = true*/;
            List<CourseScheduleDE> values = _ScheduleSVC.SearchCourseSchedules(Search);
            return Ok(values);
        }
        [HttpPost]
        public ActionResult Post(CourseScheduleDE mod)
        {
            mod.DBoperation = DBoperations.Insert;
            CourseScheduleDE Schedule = _ScheduleSVC.ManagementCourseSchedule(mod);
            return Ok(Schedule);
        }
        [HttpPut]
        public ActionResult Put(CourseScheduleDE mod)
        {
            mod.DBoperation = DBoperations.Update;
            CourseScheduleDE Schedule = _ScheduleSVC.ManagementCourseSchedule(mod);
            return Ok(Schedule);
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            CourseScheduleDE Schedule = new CourseScheduleDE
            { Id = id, DBoperation = DBoperations.Delete };
            _ScheduleSVC.ManagementCourseSchedule(Schedule);
        }

        #endregion
    }
}
