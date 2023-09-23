using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

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
        public IActionResult SearchScheduleDayEvent(ScheduleDayEventDE schedule)
        {
            List<ScheduleDayEventDE> list = _schSVC.SearchScheduleDayEvent(schedule);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetScheduleDaysEventById(int id)
        {
            ScheduleDayEventDE Schedule = new ScheduleDayEventDE { Id = id };
            var values = _schSVC.SearchScheduleDayEvent(Schedule);
            return Ok(values);
        }

        [HttpGet("GetScheduleDayEvents")]

        public IActionResult GetScheduleDayEvents()
        {
            ScheduleDayEventDE schSC = new ScheduleDayEventDE();
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
