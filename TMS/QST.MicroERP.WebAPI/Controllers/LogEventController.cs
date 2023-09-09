using Microsoft.AspNetCore.Mvc;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogEventController : ControllerBase
    {
        #region Class Variables

        private LogEventService _eventSVC;

        #endregion

        #region Constructors
        public LogEventController()
        {
            _eventSVC = new LogEventService();
        }

        #endregion
        
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            LogEventDE leventSC = new LogEventDE();
            List<LogEventDE> levent = _eventSVC.SearchLogEvents(leventSC);
            return Ok(levent);
        }
        [HttpGet("{id}")]
        public ActionResult GetLogEventById(int id)
        {
            LogEventDE leventSC = new LogEventDE { Id = id };
            var levent = _eventSVC.SearchLogEvents(leventSC);
            return Ok(levent);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(LogEventDE Search)
        {

            List<LogEventDE> levent = _eventSVC.SearchLogEvents(Search);
            return Ok(levent);



        }

        [HttpPost]
        public ActionResult Post(LogEventDE levent)
        {
            levent.DBoperation = DBoperations.Insert;
            bool LogEvent = _eventSVC.ManagementLogEvent(levent);
            return Ok(levent);
        }

        [HttpPut]
        public ActionResult Put(LogEventDE levent)
        {
            levent.DBoperation = DBoperations.Update;
            _eventSVC.ManagementLogEvent(levent);
            return Ok();
        }

        [HttpDelete]
        public ActionResult Delete(LogEventDE levent)
        {
            levent.DBoperation = DBoperations.Delete;
            _eventSVC.ManagementLogEvent(levent);
            return Ok();
        }

        #endregion
    }
}
