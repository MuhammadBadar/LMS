using Microsoft.AspNetCore.Mvc;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServicesController : ControllerBase
    {
        #region Class Variables

        private ServicesService _srvcsSvc;

        #endregion
        #region Constructors
        public ServicesController()
        {
            _srvcsSvc = new ServicesService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            ServicesDE svcSC = new ServicesDE { IsActive = true };
            List<ServicesDE> svc = _srvcsSvc.SearchServicess(svcSC);
            return Ok(svc);
        }
        [HttpGet("{id}")]
        public ActionResult GetServicesById(int id)
        {
            ServicesDE svcSC = new ServicesDE { Id = id };
            var svc = _srvcsSvc.SearchServicess(svcSC);
            return Ok(svc);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(ServicesDE Search)
        {
            List<ServicesDE> svc = _srvcsSvc.SearchServicess(Search);
            return Ok(svc);
        }

        [HttpPost]
        public ActionResult Post(ServicesDE svc)
        {
            svc.DBoperation = DBoperations.Insert;
            bool Services = _srvcsSvc.ManagementServices(svc);
            return Ok(Services);
        }

        [HttpPut]
        public ActionResult Put(ServicesDE svc)
        {
            svc.DBoperation = DBoperations.Update;
            _srvcsSvc.ManagementServices(svc);
            return Ok();
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            ServicesDE svc = new ServicesDE { Id = id, DBoperation = DBoperations.DeActivate };
            _srvcsSvc.ManagementServices(svc);
        }

        #endregion
    }
}
