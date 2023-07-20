using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CityController : ControllerBase
    {

        // GET: api/<CityController>
        #region Class Variables

        private CityService _ctySVC;

        #endregion
        #region Constructors
        public CityController()
        {
            _ctySVC = new CityService();
        }

        #endregion

        #region Http Verbs

        [HttpGet]
       

        public IActionResult GetCity()
        {
           CityDE ctySC = new CityDE();
            List<CityDE> city = _ctySVC.SearchCity(ctySC);
            return Ok(city);
        }

        //// GET api/<VocabularyController>/5
        //[HttpGet("{id}")]
        //public IActionResult GetVocabularyById(int id)
        //{
        //    return "value";
        //}


        [HttpPost("{Search}")]
        public IActionResult SearchCity(CityDE city)
        {
            List<CityDE> list = _ctySVC.SearchCity(city);
            return Ok(list);
        }







        // POST api/<VocabularyController>
        [HttpPost]
        public IActionResult PostCity(CityDE city)
        {
            city.DBoperation = LMS.Core.Enums.DBoperations.Insert;
            bool cty = _ctySVC.ManageCity(city);
            return Ok(cty);
        }


        // PUT api/<VocabularyController>/5
        [HttpPut]
        public IActionResult PutCity(CityDE city)
        {
            city.DBoperation = DBoperations.Update;
            _ctySVC.ManageCity(city);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteCity(int id)
        {
            CityDE city = new CityDE();
            city.DBoperation = DBoperations.Delete;
            city.Id = id;
            _ctySVC.ManageCity(city);
            return Ok();
        }
    }
    #endregion
}

