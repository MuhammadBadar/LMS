using Microsoft.AspNetCore.Mvc;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using QST.MicroERP.Core.ViewModel;
using QST.MicroERP.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExpenseController : ControllerBase
    {
        #region Class Variables

        private ExpenseService _exSVC;

        #endregion
        #region Constructors
        public ExpenseController()
        {
            _exSVC = new ExpenseService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            ExpenseVM expSC = new ExpenseVM();
            List<ExpenseVM> exp = _exSVC.SearchExpenses(expSC);
            return Ok(exp);
        }
        [HttpGet("{id}")]
        public ActionResult GetExpenseById(int id)
        {
            ExpenseVM expSC = new ExpenseVM { Id = id };
            var exp = _exSVC.SearchExpenses(expSC);
            return Ok(exp);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(ExpenseVM Search)
        {
            List<ExpenseVM> exp = _exSVC.SearchExpenses(Search);
            return Ok(exp);
        }

        [HttpPost]
        public ActionResult Post(ExpenseDE exp)
        {
            exp.DBoperation = DBoperations.Insert;
            bool Expense = _exSVC.ManagementExpense(exp);
            return Ok(Expense);
        }

        [HttpPut]
        public ActionResult Put(ExpenseDE exp)
        {
            exp.DBoperation = DBoperations.Update;
            _exSVC.ManagementExpense(exp);
            return Ok();
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            ExpenseDE exp = new ExpenseDE { Id = id, DBoperation = DBoperations.DeActivate };
            _exSVC.ManagementExpense(exp);
            return Ok();
        }

        #endregion
    }
}
