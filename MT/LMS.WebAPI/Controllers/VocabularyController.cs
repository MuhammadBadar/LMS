using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VocabularyController : ControllerBase
    {
        private VocabularyService _vcbSvc;
        public VocabularyController()
        {
            _vcbSvc = new VocabularyService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetVocabulary()
        {
            List<VocabularyDE> list = new List<VocabularyDE>();
            list = _vcbSvc.SearchVocabulary(new VocabularyDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SaveVocabulary(VocabularyDE vocabulary)
        {
            List<VocabularyDE> list = _vcbSvc.SearchVocabulary(vocabulary);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetVocabularyById(int id)
        {
            List<VocabularyDE> list = new List<VocabularyDE>();
            list = _vcbSvc.SearchVocabulary(new VocabularyDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostVocabulary(VocabularyDE vocabulary)
        {
            vocabulary.DBoperation = DBoperations.Insert;
            _vcbSvc.ManageVocabulary(vocabulary);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutVocabulary(VocabularyDE vocabulary)
        {
            vocabulary.DBoperation = DBoperations.Update;
            _vcbSvc.ManageVocabulary(vocabulary);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteVocabulary(int id)
        {
            VocabularyDE vocabularyDE = new VocabularyDE();
            vocabularyDE.DBoperation = DBoperations.Delete;
            vocabularyDE.Id = id;
            _vcbSvc.ManageVocabulary(vocabularyDE);
            return Ok();
        }
    }
}
