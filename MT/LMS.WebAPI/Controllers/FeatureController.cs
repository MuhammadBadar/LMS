using LMS.Core.Entities.Security;
using LMS.Core.Enums;
using LMS.Services;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.WepAPI.Controllers
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
            FeatureDE featSC = new FeatureDE();
            List<FeatureDE> feat = _featSVC.SearchFeatures(featSC);
            return Ok(feat);
        }
        [HttpGet("{id}")]
        public ActionResult GetFeatureById(int id)
        {
            FeatureDE featSC = new FeatureDE { Id = id };
            var feat = _featSVC.SearchFeatures(featSC);
            return Ok(feat);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(FeatureDE Search)
        {
            List<FeatureDE> feat = _featSVC.SearchFeatures(Search);
            return Ok(feat);
        }

        [HttpPost]
        public ActionResult Post(FeatureDE feat)
        {
            feat.DBoperation = DBoperations.Insert;
            bool feature = _featSVC.ManagementFeature(feat);
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
