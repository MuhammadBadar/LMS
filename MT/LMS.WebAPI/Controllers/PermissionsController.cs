using LMS.Core.Entities.Security;
using LMS.Core.SearchCriteria;
using LMS.Services;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize(Policy = "ManagerOnly")]
    public class PermissionsController : ControllerBase
    {

        #region Class Variables

        private PermissionsService _permsSVC;

        #endregion
        #region Constructors
        public PermissionsController()
        {
            _permsSVC = new PermissionsService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            PermissionsSearchCriteria permsSC = new PermissionsSearchCriteria();
            List<PermissionDE> perms = _permsSVC.SearchPermissions(permsSC);
            return Ok(perms);
        }

        [HttpPost("{Search}")]
        public ActionResult Search(PermissionsSearchCriteria Search)
        {
            List<PermissionDE> perms = _permsSVC.SearchPermissions(Search);
            return Ok(perms);
        }

        [HttpPost]
        public ActionResult Post(List<PermissionDE> perms)
        {

            bool per = _permsSVC.ManagementPermissions(perms);
            return Ok(per);
        }

        [HttpPut]
        public ActionResult Put(List<PermissionDE> perms)
        {

            bool per = _permsSVC.ManagementPermissions(perms);
            return Ok(per);
        }


        #endregion

    }
}
