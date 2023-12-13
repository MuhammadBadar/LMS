using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Core.Models;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Globalization;

namespace LMS.WebAPI.Controllers
{
    //public class ScheduleDayEventController : Controller
    //{
    //    // GET: ScheduleDayEventController
    //    public ActionResult Index()
    //    {
    //        return View();
    //    }

    //    // GET: ScheduleDayEventController/Details/5
    //    public ActionResult Details(int id)
    //    {
    //        return View();
    //    }

    //    // GET: ScheduleDayEventController/Create
    //    public ActionResult Create()
    //    {
    //        return View();
    //    }

    //    // POST: ScheduleDayEventController/Create
    //    [HttpPost]
    //    [ValidateAntiForgeryToken]
    //    public ActionResult Create(IFormCollection collection)
    //    {
    //        try
    //        {
    //            return RedirectToAction(nameof(Index));
    //        }
    //        catch
    //        {
    //            return View();
    //        }
    //    }

    //    // GET: ScheduleDayEventController/Edit/5
    //    public ActionResult Edit(int id)
    //    {
    //        return View();
    //    }

    //    // POST: ScheduleDayEventController/Edit/5
    //    [HttpPost]
    //    [ValidateAntiForgeryToken]
    //    public ActionResult Edit(int id, IFormCollection collection)
    //    {
    //        try
    //        {
    //            return RedirectToAction(nameof(Index));
    //        }
    //        catch
    //        {
    //            return View();
    //        }
    //    }

    //    // GET: ScheduleDayEventController/Delete/5
    //    public ActionResult Delete(int id)
    //    {
    //        return View();
    //    }

    //    // POST: ScheduleDayEventController/Delete/5
    //    [HttpPost]
    //    [ValidateAntiForgeryToken]
    //    public ActionResult Delete(int id, IFormCollection collection)
    //    {
    //        try
    //        {
    //            return RedirectToAction(nameof(Index));
    //        }
    //        catch
    //        {
    //            return View();
    //        }
    //    }
    //}


    [Route("api/[controller]")]
    [ApiController]
    public class ScheduleDayEventController : Controller
    {
        // GET: ScheduleFHController
        #region Class Variables

        private ScheduleDayEventService _schSVC;

        #endregion
        #region Constructors
        public ScheduleDayEventController()
        {
            _schSVC = new ScheduleDayEventService();
        }

        #endregion

        #region Http Verbs
        [HttpPost("{Search}")]
        public IActionResult SearchScheduleDayEvent(ScheduleDayEventSearchCriteria schedule)
        {
            List<ScheduleDayEventDE> list = _schSVC.SearchScheduleDayEvent(schedule);

            foreach (var val in list)
            {
                // Assuming StartTime and EndTime are in "HH:mm" format
                DateTime startTime = DateTime.ParseExact(val.StartTime, "HH:mm", CultureInfo.InvariantCulture);
                DateTime endTime = DateTime.ParseExact(val.EndTime, "HH:mm", CultureInfo.InvariantCulture);

                // Calculate time difference and set Sp property
                TimeSpan timeDifference = endTime - startTime;
                val.Sp = Math.Round(timeDifference.TotalHours, 2); // Rounding off to 2 decimal places.
            }

            return Ok(list);
        }

        [HttpGet("{id}")]
        public ActionResult GetScheduleDaysEventById(int id)
        {
            ScheduleDayEventSearchCriteria Schedule = new ScheduleDayEventSearchCriteria { Id = id };
            var values = _schSVC.SearchScheduleDayEvent(Schedule);
            return Ok(values);
        }


        [HttpGet("GetScheduleDayEvents/{id}")]

        public IActionResult GetScheduleDayEvents(int id)
        {
            
            ScheduleDayEventSearchCriteria schSC = new ScheduleDayEventSearchCriteria();
            //schSC.SchId = schId;
            schSC.SchDayId = id;
            List<ScheduleDayEventDE> schDayEvents = _schSVC.SearchScheduleDayEvent(schSC);
            return Ok(schDayEvents);
        }


        // POST api/<StudentController>
        [HttpPost]
        public IActionResult PostScheduleDayEvents(ScheduleDayEventDE Schedule)
        {
            Schedule.DBoperation = LMS.Core.Enums.DBoperations.Insert;
            bool sch = _schSVC.ManageScheduleDayEvent(Schedule);
            return Ok(sch);
        }


        // PUT api/<StudentController>/5
        [HttpPut]
        public IActionResult PutScheduleDayEvents(ScheduleDayEventDE Schedule)
        {
            Schedule.DBoperation = DBoperations.Update;
            _schSVC.ManageScheduleDayEvent(Schedule);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteScheduleDayEvents(int id)
        {
            ScheduleDayEventDE Schedule = new ScheduleDayEventDE();
            Schedule.DBoperation = DBoperations.Delete;
            Schedule.Id = id;
            _schSVC.ManageScheduleDayEvent(Schedule);
            return Ok();
        }
    }
    #endregion

}
