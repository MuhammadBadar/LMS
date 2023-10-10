
using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EnumValuesController : ControllerBase  
    {

        #region Class Variables

        private CoreService _coreSVC;

        #endregion
        #region Constructors
        public EnumValuesController()
        {
            _coreSVC = new CoreService();
        }

        #endregion
        #region Http Verbs
        [HttpGet("{type}")]
        public List<EnumValueDE> Get(EnumType type)
        {
 
            List<EnumValueDE> enumvalues = _coreSVC.GetEnumValues(type);
            return enumvalues;
        }


        [HttpPost]
        public ActionResult Post(EnumValueDE mod)
        {

            bool value = _coreSVC.ManageEnumValue(mod);
            return Ok(value);
        }
        #endregion
    }
}
