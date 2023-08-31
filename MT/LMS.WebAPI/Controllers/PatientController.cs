using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class PatientController : Controller
    {
        private PatientService _patSvc;
        public PatientController()
        {
            _patSvc = new PatientService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetPatient()
        {
            List<PatientDE> list = new List<PatientDE>();
            list = _patSvc.SearchPatient(new PatientDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchPatient(PatientDE patient)
        {
            List<PatientDE> list = _patSvc.SearchPatient(patient);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetPatientId(int id)
        {
            List<PatientDE> list = new List<PatientDE>();
            list = _patSvc.SearchPatient(new PatientDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostPatient(PatientDE patient)
        {
            patient.DBoperation = DBoperations.Insert;
            _patSvc.ManagePatient(patient);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutPatient(PatientDE patient)
        {
            patient.DBoperation = DBoperations.Update;
            _patSvc.ManagePatient(patient);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeletePatient(int id)
        {
            PatientDE patDE = new PatientDE();
            patDE.DBoperation = DBoperations.Delete;
            patDE.Id = id;
            _patSvc.ManagePatient(patDE);
            return Ok();
        }
    }
}
