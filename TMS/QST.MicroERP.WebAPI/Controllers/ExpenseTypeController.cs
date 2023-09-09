using Microsoft.AspNetCore.Mvc;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExpenseTypeController : ControllerBase
    {
        #region Class Variables

        private ExpenseTypeService _exTSVC;

        #endregion
        #region Constructors
        public ExpenseTypeController()
        {
            _exTSVC = new ExpenseTypeService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            ExpenseTypeDE exTSC = new ExpenseTypeDE();
            List<ExpenseTypeDE> exT = _exTSVC.SearchExpenseTypes(exTSC);
            return Ok(exT);
        }
        [HttpGet("{id}")]
        public ActionResult GetExpenseTypeById(int id)
        {
            ExpenseTypeDE exTSC = new ExpenseTypeDE { Id = id };
            var exT = _exTSVC.SearchExpenseTypes(exTSC);
            return Ok(exT);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(ExpenseTypeDE Search)
        {
            List<ExpenseTypeDE> exT = _exTSVC.SearchExpenseTypes(Search);
            return Ok(exT);
        }

        [HttpPost]
        public ActionResult Post(ExpenseTypeDE exT)
        {
            exT.DBoperation = DBoperations.Insert;
            bool ExpenseType = _exTSVC.ManagementExpenseType(exT);
            return Ok(ExpenseType);
        }

        [HttpPut]
        public ActionResult Put(ExpenseTypeDE exT)
        {
            exT.DBoperation = DBoperations.Update;
            _exTSVC.ManagementExpenseType(exT);
            return Ok();
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            ExpenseTypeDE exT = new ExpenseTypeDE { Id = id, DBoperation = DBoperations.DeActivate };
            _exTSVC.ManagementExpenseType(exT);
            return Ok();
        }

        #endregion
    }
}
