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
    public class FieldPossibleValuesController : ControllerBase
    {
        #region Class Variables

        private FieldPossibleValuesService _fieldSVC;

        #endregion
        #region Constructors
        public FieldPossibleValuesController()
        {
            _fieldSVC = new FieldPossibleValuesService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            FieldPossibleValuesDE fieldSC = new FieldPossibleValuesDE { IsActive = true };
            List<FieldPossibleValuesDE> Field = _fieldSVC.SearchFieldPossibleValuess(fieldSC);
            return Ok(Field);
        }


        [HttpPost("{Search}")]
        public ActionResult Search(FieldPossibleValuesDE Search)
        {
            List<FieldPossibleValuesDE> Field = _fieldSVC.SearchFieldPossibleValuess(Search);
            return Ok(Field);
        }

        [HttpPost]
        public void Post(FieldPossibleValuesDE Field)
        {
            Field.DBoperation = DBoperations.Insert;
            _fieldSVC.ManagementFieldPossibleValues(Field);
        }

        [HttpPut]
        public void Put(FieldPossibleValuesDE Field)
        {
            Field.DBoperation = DBoperations.Update;
            _fieldSVC.ManagementFieldPossibleValues(Field);
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            FieldPossibleValuesDE Field = new FieldPossibleValuesDE();
            Field.Id = id;
            Field.DBoperation = DBoperations.DeActivate;
            _fieldSVC.ManagementFieldPossibleValues(Field);
        }

        #endregion
    }
}
