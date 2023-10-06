using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class ClientController : Controller
    {
        private ClientService _cltSvc;
        public ClientController()
        {
            _cltSvc = new ClientService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetClient()
        {
            List<ClientDE> list = new List<ClientDE>();
            list = _cltSvc.SearchClient(new ClientDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchClient(ClientDE client)
        {
            List<ClientDE> list = _cltSvc.SearchClient(client);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetClientId(int id)
        {
            List<ClientDE> list = new List<ClientDE>();
            list = _cltSvc.SearchClient(new ClientDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostClient(ClientDE client)
        {
            client.DBoperation = DBoperations.Insert;
            _cltSvc.ManageClient(client);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutClient(ClientDE client)
        {
            client.DBoperation = DBoperations.Update;
            _cltSvc.ManageClient(client);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeletePatient(int id)
        {
            ClientDE patDE = new ClientDE();
            patDE.DBoperation = DBoperations.Delete;
            patDE.Id = id;
            _cltSvc.ManageClient(patDE);
            return Ok();
        }
    }
}
