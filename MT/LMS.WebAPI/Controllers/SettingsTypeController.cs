using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SettingsTypeController : ControllerBase
    {
        #region Class Variables
        private SettingsTypeService _settingsTypeSVC;
        #endregion
        #region Constructor
        public SettingsTypeController()
        {
            _settingsTypeSVC = new SettingsTypeService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            SettingsTypeDE SettingsType = new SettingsTypeDE ();
            List<SettingsTypeDE> categories = _settingsTypeSVC.SearchSettingsTypes(SettingsType);
            return Ok(categories);
        }
        [HttpGet("{id}")]
        public ActionResult GetSettingsTypeById(int id)
        {
            SettingsTypeDE SettingsType = new SettingsTypeDE { Id = id };
            var categories = _settingsTypeSVC.SearchSettingsTypes(SettingsType);
            return Ok(categories);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(SettingsTypeDE Search)
        {
            //Search.IsActive = true;
            List<SettingsTypeDE> categories = _settingsTypeSVC.SearchSettingsTypes(Search);
            return Ok(categories);
        }
        [HttpPost]
        public ActionResult Post(SettingsTypeDE stngType)
        {
            stngType.DBoperation = DBoperations.Insert;
            bool SettingsType = _settingsTypeSVC.ManagementSettingsType(stngType);
            return Ok(SettingsType);
        }
        [HttpPut]
        public ActionResult Put(SettingsTypeDE stngType)
        {
            stngType.DBoperation = DBoperations.Update;
            _settingsTypeSVC.ManagementSettingsType(stngType);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            SettingsTypeDE SettingsType = new SettingsTypeDE { Id = id, DBoperation = DBoperations.DeActivate };
            _settingsTypeSVC.ManagementSettingsType(SettingsType);
        }

        #endregion
    }
}
