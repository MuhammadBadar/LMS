using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CityStudentController : Controller
    {

        // GET: api/<CityController>
        #region Class Variables

        private CityStudentService _ctystdSVC;

        #endregion
        #region Constructors
        public CityStudentController()
        {
            _ctystdSVC = new CityStudentService();
        }

        #endregion

        #region Http Verbs
        [HttpPost("{Search}")]
        public IActionResult SearchCityStudent(CityStudentDE ctyStudent)
        {
            List<CityStudentDE> list = _ctystdSVC.SearchCityStudent(ctyStudent);
            return Ok(list);
        }


        [HttpGet]

        public IActionResult GetCityStudent()
        {
            CityStudentDE ctystd = new CityStudentDE();
            List<CityStudentDE> city = _ctystdSVC.SearchCityStudent(ctystd);
            return Ok(city);
        }

        








        // POST api/<VocabularyController>
        [HttpPost]
        public IActionResult PostCityStudent(CityStudentDE citystd)
        {
            citystd.DBoperation = LMS.Core.Enums.DBoperations.Insert;
            bool cty = _ctystdSVC.ManageCityStudent(citystd);
            return Ok(cty);
        }


        // PUT api/<VocabularyController>/5
        [HttpPut]
        public IActionResult PutCityStudent(CityStudentDE city)
        {
            city.DBoperation = DBoperations.Update;
            _ctystdSVC.ManageCityStudent(city);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteCityStudent(int id)
        {
            CityStudentDE city = new CityStudentDE();
            city.DBoperation = DBoperations.Delete;
            city.Id = id;
            _ctystdSVC.ManageCityStudent(city);
            return Ok();
        }
    }
    #endregion
}
