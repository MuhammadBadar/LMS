using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.ViewModel;
using QST.MicroERP.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace QST.MicroERP.WepAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FieldController : ControllerBase
    {
        #region Class Variables

        private FieldService _fieldSVC;

        #endregion
        #region Constructors
        public FieldController()
        {
            _fieldSVC = new FieldService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
           // FieldVM fieldSC = new FieldVM { IsActive = true };
            List<FieldVM> Field = _fieldSVC.GetFieldPossibleValues();
            return Ok(Field);
        }


        [HttpPost("{Search}")]
        public ActionResult Search(FieldVM Search)
        {
            List<FieldVM> Field = _fieldSVC.SearchFields(Search);
            return Ok(Field);
        }

        [HttpPost]
        public void Post(FieldDE Field)
        {
            Field.DBoperation = DBoperations.Insert;
            _fieldSVC.ManagementField(Field);
        }

        [HttpPut]
        public void Put(FieldDE Field)
        {
            Field.DBoperation = DBoperations.Update;
            _fieldSVC.ManagementField(Field);
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            FieldDE Field = new FieldDE();
            Field.Id = id;
            Field.DBoperation = DBoperations.DeActivate;
            _fieldSVC.ManagementField(Field);
        }

        #endregion
    }
}
