using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
using QST.MicroERP.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentLectureController : ControllerBase
    {

        #region Class Variables

        private StudentLectureService _stdlSVC;

        #endregion
        #region Constructors
        public StudentLectureController()
        {
            _stdlSVC = new StudentLectureService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            StudentLectureSearchCriteria StudentLectureSC = new StudentLectureSearchCriteria { IsActive = true };
            List<StudentLecturesDE> stdl = _stdlSVC.SearchStudentLectures(StudentLectureSC);
            return Ok(stdl);
        }

        [HttpPost("{Search}")]
        public ActionResult Search(StudentLectureSearchCriteria Search)
        {
            List<StudentLecturesDE> stdl = _stdlSVC.SearchStudentLectures(Search);
            return Ok(stdl);
        }

        [HttpPost]
        public void Post(StudentLecturesDE stdl)
        {
            stdl.DBoperation = DBoperations.Insert;
            _stdlSVC.ManagementStudentLecture(stdl);
        }

        [HttpPut]
        public void Put(StudentLecturesDE stdl)
        {
            stdl.DBoperation = DBoperations.Update;
            _stdlSVC.ManagementStudentLecture(stdl);
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            StudentLecturesDE stdl = new StudentLecturesDE();
            stdl.Id = id;
            stdl.DBoperation = DBoperations.DeActivate;
            _stdlSVC.ManagementStudentLecture(stdl);
        }

        #endregion

    }
}
