using LMS.Core.Entities;
using LMS.Core.Enums;
using MicroERP.Core.Entities;
using MicroERP.Service;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MicroERP.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VocabularyController : ControllerBase
    {
        // GET: api/<VocabularyController>
        #region Class Variables

        private VocabularyService _vcbSVC;

        #endregion
        #region Constructors
        public VocabularyController()
        {
            _vcbSVC = new VocabularyService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        //[HttpGet("{Vocabulary}")]

        public IActionResult GetVocabulary()
        {
            VocabularyDE vcbSC = new VocabularyDE();
            List<VocabularyDE> vocab = _vcbSVC.SearchVocabulary(vcbSC);
            return Ok(vocab);
        }

        //// GET api/<VocabularyController>/5
        //[HttpGet("{id}")]
        //public IActionResult GetVocabularyById(int id)
        //{
        //    return "value";
        //}










        // POST api/<VocabularyController>
        [HttpPost]
        public IActionResult PostVocabulary(VocabularyDE vocab)
        {
            vocab.DBoperation = LMS.Core.Enums.DBoperations.Insert;
            bool vcb = _vcbSVC.ManageVocabulary(vocab);
            return Ok(vcb);
        }


        // PUT api/<VocabularyController>/5
        [HttpPut]
        public IActionResult PutVocabulary(VocabularyDE vocab)
        {
            vocab.DBoperation = DBoperations.Update;
            _vcbSVC.ManageVocabulary(vocab);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteVocabulary(int id)
        {
            VocabularyDE vocab = new VocabularyDE();
            vocab.DBoperation = DBoperations.Delete;
            vocab.Id = id;
            _vcbSVC.ManageVocabulary(vocab);
            return Ok();
        }
    }
    #endregion
}