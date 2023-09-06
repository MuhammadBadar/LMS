using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Core.ViewModel;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class AttendanceController : ControllerBase
    {
        #region Class Variables
        private AttendanceService attSVC;
        #endregion
        #region Constructor
        public AttendanceController()
        {
            attSVC = new AttendanceService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            AttendanceVM Att = new AttendanceVM();
            List<AttendanceVM> values = attSVC.SearchAttendance(Att);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetAttendanceById(int id)
        {
            AttendanceVM att = new AttendanceVM { Id = id };
            var values = attSVC.SearchAttendance(att);
            return Ok(values);
        }


        [HttpPost("{Search}")]
        public IActionResult SearchAttendance(AttendanceVM Attendance)
        {
            
            List<AttendanceVM> list = attSVC.SearchAttendance(Attendance);
            return Ok(list);
        }
        [HttpPost]
        public IActionResult PostAttendance(AttendanceVM Attendance)
        {
            Attendance.DBoperation = DBoperations.Insert;
            attSVC.ManageAttendance(Attendance);
            return Ok();
        }

        [HttpPut]
        public ActionResult Put(AttendanceVM Attendance)
        {
            Attendance.DBoperation = DBoperations.Update;
            attSVC.ManageAttendance(Attendance);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            AttendanceVM Attendance = new AttendanceVM { Id = id, DBoperation = DBoperations.Delete };
            attSVC.ManageAttendance(Attendance);
        }
        #endregion
    }
}