using Microsoft.AspNetCore.Mvc;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttendanceController : ControllerBase
    {
        #region Class Variables

        private AttendanceService _attndSVC;

        #endregion
        #region Constructors
        public AttendanceController()
        {
            _attndSVC = new AttendanceService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            AttendanceDE attndSC = new AttendanceDE();
            List<AttendanceDE> attnd = _attndSVC.SearchAttendances(attndSC);
            return Ok(attnd);
        }
        [HttpGet("{id}")]
        public ActionResult GetAttendanceById(int id)
        {
            AttendanceDE attndSC = new AttendanceDE { Id = id };
            var attnd = _attndSVC.SearchAttendances(attndSC);
            return Ok(attnd);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(AttendanceDE Search)
        {

                List<AttendanceDE> attnd = _attndSVC.SearchAttendances(Search);
                return Ok(attnd);
           
   

        }

        [HttpPost]
        public ActionResult Post(AttendanceDE attnd)
        {
            attnd.DBoperation = DBoperations.Insert;
            bool Attendance = _attndSVC.ManagementAttendance(attnd);
            return Ok(attnd);
        }

        [HttpPut]
        public ActionResult Put(AttendanceDE attnd)
        {
            attnd.DBoperation = DBoperations.Update;
            attnd.OutTime=  DateTime.Now;
            _attndSVC.ManagementAttendance(attnd);
            return Ok();
        }

        [HttpDelete]
        public ActionResult Delete(AttendanceDE attnd)
        {
            attnd.DBoperation = DBoperations.Delete;
            _attndSVC.ManagementAttendance(attnd);
            return Ok();
        }

        #endregion
    }
}
