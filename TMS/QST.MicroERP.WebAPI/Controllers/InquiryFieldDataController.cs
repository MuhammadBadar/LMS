using Microsoft.AspNetCore.Mvc;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InquiryFieldDataController : ControllerBase
    {
        #region Class Variables

        private InquiryFieldDataService _ifdSVC;

        #endregion
        #region Constructors
        public InquiryFieldDataController()
        {
            _ifdSVC = new InquiryFieldDataService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            InquiryFieldDataVM expSC = new InquiryFieldDataVM();
            List<InquiryFieldDataVM> exp = _ifdSVC.SearchInquiryFieldDatas(expSC);
            return Ok(exp);
        }
        [HttpGet("{id}")]
        public ActionResult GetInquiryFieldDataById(int id)
        {
            InquiryFieldDataVM expSC = new InquiryFieldDataVM { Id = id };
            var exp = _ifdSVC.SearchInquiryFieldDatas(expSC);
            return Ok(exp);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(InquiryFieldDataVM Search)
        {
            List<InquiryFieldDataVM> exp = _ifdSVC.SearchInquiryFieldDatas(Search);
            return Ok(exp);
        }

        [HttpPost]
        public ActionResult Post(List<InquiryFieldDataDE> exp)
        {
            
            bool InquiryFieldData = _ifdSVC.ManageInquiryFieldData(exp);
            return Ok(InquiryFieldData);
        }

        [HttpPut]
        public ActionResult Put(InquiryFieldDataDE exp)
        {
            exp.DBoperation = DBoperations.Update;
            _ifdSVC.ManagementInquiryFieldData(exp);
            return Ok();
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            InquiryFieldDataDE exp = new InquiryFieldDataDE { Id = id, DBoperation = DBoperations.DeActivate };
            _ifdSVC.ManagementInquiryFieldData(exp);
            return Ok();
        }

        #endregion
    }
}
