using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotificationLogController : ControllerBase
    {
        #region Class Variables

        private NotificationLogService _nLogSVC;

        #endregion
        #region Constructors
        public NotificationLogController()
        {
            _nLogSVC = new NotificationLogService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult GetNextNotificationLog()
        {
            NotificationLogDE notification =new NotificationLogDE { IsSent = false };
            List<NotificationLogDE> nLog = _nLogSVC.SearchNotificationLogs(notification);
            var minId = nLog.Min(x => x.Id);
             notification = nLog.First(x=>x.Id == minId);
            //notification = nLog.First();
            return Ok(notification);
        }
        [HttpGet("{id}")]
        public ActionResult GetNotificationLogById(int id)
        {
            NotificationLogDE nLogSC = new NotificationLogDE { Id = id };
            var nLog = _nLogSVC.SearchNotificationLogs(nLogSC);
            return Ok(nLog);
        }
        [HttpPost("{Search}")]
        public ActionResult SearchNotificationLog(NotificationLogDE Search)
        {
            List<NotificationLogDE> nLog = _nLogSVC.SearchNotificationLogs(Search);
            return Ok(nLog);
        }

        [HttpPost]
        public ActionResult PostNotificationLog(NotificationLogDE nLog)
        {
            nLog.DBoperation = DBoperations.Insert;
            bool NotificationLog = _nLogSVC.ManagementNotificationLog(nLog);
            return Ok(NotificationLog);
        }

        [HttpPut]
        public ActionResult UpdateNotificationStatus(NotificationLogDE nLog)

        {
            nLog.IsSent= true;
            nLog.DBoperation = DBoperations.Update;
            _nLogSVC.ManagementNotificationLog(nLog);
            return Ok();
        }

        [HttpDelete]
        public ActionResult Delete(NotificationLogDE nLog)
        {
            nLog.DBoperation = DBoperations.Delete;
            _nLogSVC.ManagementNotificationLog(nLog);
            return Ok();
        }

        #endregion
    }
}
