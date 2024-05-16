using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities.Acc;
using Restaurant.Service.Acc;

namespace Restaurant.WebAPI.Acc.Controllers
{
    [Route ("api/[controller]")]
    [ApiController]
    public class ChartOfAccountController : ControllerBase
    {
        public readonly IAccService _coaSvc;
        public ChartOfAccountController (IAccService coaSvc)
        {
            _coaSvc = coaSvc;
        }
        [HttpGet]
        public IActionResult GetPage ( )
        {
            List<ChartOfAccountDE> list = new List<ChartOfAccountDE> ();
            list = _coaSvc.SearchChartOfAccount (new ChartOfAccountDE ());
            return Ok (list);
        }

        [HttpPost ("{Search}")]
        public IActionResult SearchChartOfAccount ( ChartOfAccountDE ChartOfAccount )
        {
            List<ChartOfAccountDE> list = _coaSvc.SearchChartOfAccount (ChartOfAccount);
            return Ok (list);
        }

        [HttpPost ("Accounts")]
        public IActionResult GetChartOfAccount ( ChartOfAccountDE ChartOfAccount )
        {
            List<ChartOfAccountDE> list = _coaSvc.GetAccounts (ChartOfAccount);
            return Ok (list);
        }

        [HttpGet ("{id}")]
        public IActionResult GetChartOfAccountById ( int id )
        {
            List<ChartOfAccountDE> list = new List<ChartOfAccountDE> ();
            list = _coaSvc.SearchChartOfAccount (new ChartOfAccountDE { Id = id });
            return Ok (list[0]);

        }

        [HttpPost]
        public IActionResult PostChartOfAccount ( ChartOfAccountDE ChartOfAccount )
        {
            ChartOfAccount.DBoperation = DBoperations.Insert;
            ChartOfAccount= _coaSvc.ManageChartOfAccount (ChartOfAccount);
            return Ok (ChartOfAccount);
        }

        [HttpPut]
        public IActionResult PutChartOfAccount ( ChartOfAccountDE ChartOfAccount )
        {
            ChartOfAccount.DBoperation = DBoperations.Update;
            ChartOfAccount=_coaSvc.ManageChartOfAccount (ChartOfAccount);
            return Ok (ChartOfAccount);
        }

        [HttpDelete ("{id}")]
        public IActionResult DeleteChartOfAccount ( int id )
        {
            ChartOfAccountDE ChartOfAccountDe = new ChartOfAccountDE ();
            ChartOfAccountDe.DBoperation = DBoperations.Delete;
            ChartOfAccountDe.Id = id;
            _coaSvc.ManageChartOfAccount (ChartOfAccountDe);
            return Ok ();
        }
    }
}
