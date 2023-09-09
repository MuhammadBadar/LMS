using QST.MicroERP.Core.Entities.Security;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
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
    public class FeatureController : ControllerBase
    {
        #region Class Variables

        private FeatureService _featSVC;

        #endregion
        #region Constructors
        public FeatureController()
        {
            _featSVC = new FeatureService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            FeatureSearchCriteria featSC = new FeatureSearchCriteria();
            List<FeatureDE> feat = _featSVC.SearchFeatures(featSC);
            return Ok(feat);
        }
        [HttpGet("{id}")]
        public ActionResult GetFeatureById(int id)
        {
            FeatureSearchCriteria featSC = new FeatureSearchCriteria { Id = id };
            var feat = _featSVC.SearchFeatures(featSC);
            return Ok(feat);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(FeatureSearchCriteria Search)
        {
            List<FeatureDE> feat = _featSVC.SearchFeatures(Search);
            return Ok(feat);
        }

        [HttpPost]
        public ActionResult  Post(FeatureDE feat)
        {
            feat.DBoperation = DBoperations.Insert;
            bool feature =_featSVC.ManagementFeature(feat);
            return Ok(feature);
        }

        [HttpPut]
        public ActionResult Put(FeatureDE feat)
        {
            feat.DBoperation = DBoperations.Update;
            _featSVC.ManagementFeature(feat);
            return Ok();
        }

        [HttpDelete]
        public ActionResult Delete(FeatureDE feat)
        {
            feat.DBoperation = DBoperations.Delete;
            _featSVC.ManagementFeature(feat);
            return Ok();
        }

        #endregion
    }
}
