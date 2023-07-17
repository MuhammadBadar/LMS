using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseDetailController : ControllerBase
    {
        #region Class Variables
        private CourseDetailService _CourseDetailSVC;
        #endregion
        #region Constructor
        public CourseDetailController()
        {
            _CourseDetailSVC = new CourseDetailService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            CourseDetailDE CourseDetail = new CourseDetailDE();
            List<CourseDetailDE> values = _CourseDetailSVC.SearchCourseDetails(CourseDetail);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetCourseDetailById(int id)
        {
            CourseDetailDE CourseDetail = new CourseDetailDE { Id = id };
            var values = _CourseDetailSVC.SearchCourseDetails(CourseDetail);
            return Ok(values);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(CourseDetailDE Search)
        {
            //Search.IsActive = true;
            List<CourseDetailDE> values = _CourseDetailSVC.SearchCourseDetails(Search);
            return Ok(values);
        }
        [HttpPost]
        public ActionResult Post(CourseDetailDE mod)
        {
            mod.DBoperation = DBoperations.Insert;
            bool CourseDetail = _CourseDetailSVC.ManagementCourseDetail(mod);
            return Ok(CourseDetail);
        }
        [HttpPut]
        public ActionResult Put(CourseDetailDE mod)
        {
            mod.DBoperation = DBoperations.Update;
            _CourseDetailSVC.ManagementCourseDetail(mod);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            CourseDetailDE CourseDetail = new CourseDetailDE { Id = id, DBoperation = DBoperations.Delete };
            _CourseDetailSVC.ManagementCourseDetail(CourseDetail);
        }

        #endregion
    }
}
