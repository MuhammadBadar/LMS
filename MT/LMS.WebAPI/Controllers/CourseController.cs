using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseController : ControllerBase
    {
        #region Class Variables
        private CourseService _CourseSVC;
        #endregion
        #region Constructor
        public CourseController()
        {
            _CourseSVC = new CourseService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            CourseDE Course = new CourseDE { IsActive = true };
            List<CourseDE> values = _CourseSVC.SearchCourses(Course);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetCourseById(int id)
        {
            CourseDE Course = new CourseDE { Id = id };
            var values = _CourseSVC.SearchCourses(Course);
            return Ok(values);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(CourseDE Search)
        {
            Search.IsActive = true;
            List<CourseDE> values = _CourseSVC.SearchCourses(Search);
            return Ok(values);
        }
        [HttpPost]
        public ActionResult Post(CourseDE mod)
        {
            mod.DBoperation = DBoperations.Insert;
            bool Course = _CourseSVC.ManagementCourse(mod);
            return Ok(Course);
        }
        [HttpPut]
        public ActionResult Put(CourseDE mod)
        {
            mod.DBoperation = DBoperations.Update;
            _CourseSVC.ManagementCourse(mod);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            CourseDE Course = new CourseDE { Id = id, DBoperation = DBoperations.Delete };
            _CourseSVC.ManagementCourse(Course);
        }

        #endregion
    }
}
