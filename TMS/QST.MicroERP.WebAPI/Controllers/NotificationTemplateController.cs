using Microsoft.AspNetCore.Mvc;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotificationTemplateController : ControllerBase
    {
        #region Class Variables

        private NotificationTemplateService _nTemSVC;

        #endregion
        #region Constructors
        public NotificationTemplateController()
        {
            _nTemSVC = new NotificationTemplateService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            NotificationTemplateDE nTemSC = new NotificationTemplateDE();
            List<NotificationTemplateDE> nTem = _nTemSVC.SearchNotificationTemplates(nTemSC);
            return Ok(nTem);
        }
        [HttpGet("{id}")]
        public ActionResult GetNotificationTemplateById(int id)
        {
            NotificationTemplateDE nTemSC = new NotificationTemplateDE { Id = id };
            var nTem = _nTemSVC.SearchNotificationTemplates(nTemSC);
            return Ok(nTem);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(NotificationTemplateDE Search)
        {
            List<NotificationTemplateDE> nTem = _nTemSVC.SearchNotificationTemplates(Search);
            return Ok(nTem);
        }

        [HttpPost]
        public ActionResult Post(NotificationTemplateDE nTem)
        {
            nTem.DBoperation = DBoperations.Insert;
            bool NotificationTemplate = _nTemSVC.ManagementNotificationTemplate(nTem);
            return Ok(NotificationTemplate);
        }

        [HttpPut]
        public ActionResult Put(NotificationTemplateDE nTem)
        {
            nTem.DBoperation = DBoperations.Update;
            _nTemSVC.ManagementNotificationTemplate(nTem);
            return Ok();
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            NotificationTemplateDE tem = new NotificationTemplateDE { Id = id, DBoperation = DBoperations.DeActivate };
            _nTemSVC.ManagementNotificationTemplate(tem);
        }

        #endregion
    }
}
