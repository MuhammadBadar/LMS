using Microsoft.AspNetCore.Mvc;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ManageConpanyController : ControllerBase
    {
        #region Class Variables

        private ManageCompanyService _comtSVC;

        #endregion
        #region Constructors
        public ManageConpanyController()
        {
            _comtSVC = new ManageCompanyService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            ManageCompanyDE mngCom = new ManageCompanyDE();
            List<ManageCompanyDE> feat = _comtSVC.SearchCompany(mngCom);
            return Ok(feat);
        }
        [HttpGet("{id}")]
        public ActionResult GetFeatureById(int id)
        {
            ManageCompanyDE mngCom = new ManageCompanyDE { Id = id };
            var feat = _comtSVC.SearchCompany(mngCom);
            return Ok(feat);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(ManageCompanyDE com)
        {
            List<ManageCompanyDE> comsVC = _comtSVC.SearchCompany(com);
            return Ok(comsVC);
        }

        [HttpPost]
        public ActionResult Post(ManageCompanyDE com)
        {
            com.DBoperation = DBoperations.Insert;
            bool mngCom = _comtSVC.ManagementCompany(com);
            return Ok(mngCom);
        }

        [HttpPut]
        public ActionResult Put(ManageCompanyDE com)
        {
            com.DBoperation = DBoperations.Update;
            _comtSVC.ManagementCompany(com);
            return Ok();
        }

        [HttpDelete]
        public ActionResult Delete(ManageCompanyDE com)
        {
            com.DBoperation = DBoperations.Delete;
            _comtSVC.ManagementCompany(com);
            return Ok();
        }

        #endregion
    }
}
