using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WepAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InquiryController : ControllerBase
    {
        #region Class Variables

        private InquiryService _inqrySVC;

        #endregion
        #region Constructors
        public InquiryController()
        {
            _inqrySVC = new InquiryService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            InquiryDE inqrySC = new InquiryDE { IsActive = true };
            List<InquiryDE> Inquiry = _inqrySVC.GetInquiry(inqrySC);
            return Ok(Inquiry);
        }


        [HttpPost("{Search}")]
        public ActionResult Search(InquiryDE Search)
        {
            List<InquiryDE> Inquiry = _inqrySVC.SearchInquiry(Search);
            return Ok(Inquiry);
        }

        [HttpPost]
        public ActionResult Post(InquiryDE Inquiry)
        {
            Inquiry.DBoperation = DBoperations.Insert;
            _inqrySVC.ManagementInquiry(Inquiry);
            return Ok(Inquiry);
        }

        [HttpPut]
        public ActionResult Put(InquiryDE Inquiry)
        {
            Inquiry.DBoperation = DBoperations.Update;
            _inqrySVC.ManagementInquiry(Inquiry);
            return Ok(Inquiry);
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            InquiryDE Inquiry = new InquiryDE();
            Inquiry.Id = id;
            Inquiry.DBoperation = DBoperations.DeActivate;
            _inqrySVC.ManagementInquiry(Inquiry);
        }

        #endregion
    }
}
