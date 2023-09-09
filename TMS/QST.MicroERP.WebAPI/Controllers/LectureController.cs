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
    public class LectureController : ControllerBase
    {
        #region Class Variables

        private LectureService _lecSVC;

        #endregion
        #region Constructors
        public LectureController()
        {
            _lecSVC = new LectureService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            LectureSearchCriteria LectureSC = new LectureSearchCriteria { IsActive = true };
            List<LectureDE> lec = _lecSVC.SearchLectures(LectureSC);
            return Ok(lec);
        }

        [HttpPost("{Search}")]
        public ActionResult Search(LectureSearchCriteria Search)
        {
            List<LectureDE> lec = _lecSVC.SearchLectures(Search);
            return Ok(lec);
        }

        [HttpPost]
        public void Post(LectureDE lec)
        {
            lec.DBoperation = DBoperations.Insert;
            _lecSVC.ManagementLecture(lec);
        }

        [HttpPut]
        public void Put(LectureDE lec)
        {
            lec.DBoperation = DBoperations.Update;
            _lecSVC.ManagementLecture(lec);
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            LectureDE lec = new LectureDE();
            lec.Id = id;
            lec.DBoperation = DBoperations.DeActivate;
            _lecSVC.ManagementLecture(lec);
        }

        #endregion
    }
}
