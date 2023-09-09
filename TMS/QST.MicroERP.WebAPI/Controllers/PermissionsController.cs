using QST.MicroERP.Core.Entities.Security;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.SearchCriteria;
using QST.MicroERP.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MicroERP.WepAPI.Controllers
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
        public ActionResult Post(PermissionDE perms)
        {
            perms.DBoperation = DBoperations.Insert;
            bool per= _permsSVC.ManagementPermissions(perms);
            return Ok(per);
        }

        [HttpPut]
        public ActionResult Put(PermissionDE perms)
        {
            perms.DBoperation = DBoperations.Update;
            bool per = _permsSVC.ManagementPermissions(perms);
            return Ok(per);
        }

        [HttpDelete]
        public void Delete(PermissionDE perms)
        {
            perms.DBoperation = DBoperations.Delete;
            _permsSVC.ManagementPermissions(perms);
        }

        #endregion

    }
}
