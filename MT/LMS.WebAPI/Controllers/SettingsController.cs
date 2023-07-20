using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SettingsController : ControllerBase
    {
        #region Class Variables
        private SettingsService _settingsSVC;
        #endregion
        #region Constructor
        public SettingsController()
        {
            _settingsSVC = new SettingsService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            SettingsDE Settings = new SettingsDE();
            List<SettingsDE> categories = _settingsSVC.SearchSettingss(Settings);
            return Ok(categories);
        }
        [HttpGet("{id}")]
        public ActionResult GetSettingsById(int id)
        {
            SettingsDE Settings = new SettingsDE { Id = id };
            var categories = _settingsSVC.SearchSettingss(Settings);
            return Ok(categories);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(SettingsDE Search)
        {
            //Search.IsActive = true;
            List<SettingsDE> categories = _settingsSVC.SearchSettingss(Search);
            return Ok(categories);
        }
        [HttpGet("{Id}/{KeyCode}")]
        public ActionResult SearchByKeyCode(int Id, string KeyCode)
        {
            SettingsDE Search = new SettingsDE { EnumTypeId = Id, IsActive = true, TypeKeyCode = KeyCode };
            List<SettingsDE> categories = _settingsSVC.SearchSettingss(Search);
            return Ok(categories);
        }
        [HttpPost]
        public ActionResult Post(SettingsDE stng)
        {
            stng.DBoperation = DBoperations.Insert;
            bool Settings = _settingsSVC.ManagementSettings(stng);
            return Ok(Settings);
        }
        [HttpPut]
        public ActionResult Put(SettingsDE stng)
        {
            stng.DBoperation = DBoperations.Update;
            _settingsSVC.ManagementSettings(stng);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            SettingsDE Settings = new SettingsDE { Id = id, DBoperation = DBoperations.Delete };
            _settingsSVC.ManagementSettings(Settings);
        }

        #endregion
    }
}
