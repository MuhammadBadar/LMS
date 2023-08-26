﻿using LMS.Core.Entities;
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
      

        #endregion
    }
}