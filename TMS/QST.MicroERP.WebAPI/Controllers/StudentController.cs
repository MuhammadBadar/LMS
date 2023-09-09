using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
using QST.MicroERP.Core.ViewModel;
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
    public class StudentController : ControllerBase
    {

        #region Class Variables

        private StudentService _stdSVC;

        #endregion
        #region Constructors
        public StudentController()
        {
            _stdSVC = new StudentService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            StudentSearchCriteria StudentSC = new StudentSearchCriteria { IsActive = true };
            List<StudentDE> std = _stdSVC.SearchStudents(StudentSC);
            return Ok(std);
        }

        [HttpPost("{Search}")]
        public ActionResult Search(StudentSearchCriteria Search)
        {
            List<StudentDE> std = _stdSVC.SearchStudents(Search);
            return Ok(std);
        }

        [HttpPost]
        public void Post(StudentDE std)
        {
            std.DBoperation = DBoperations.Insert;
            _stdSVC.ManagementStudent(std);
        }

        [HttpPut]
        public void Put(StudentDE std)
        {
            std.DBoperation = DBoperations.Update;
            _stdSVC.ManagementStudent(std);
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            StudentDE std = new StudentDE();
            std.Id = id;
            std.DBoperation = DBoperations.DeActivate;
            _stdSVC.ManagementStudent(std);
        }

        #endregion;

    }
}
