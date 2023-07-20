using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TopicController : ControllerBase
    {
        private TopicService _topicSvc;
        public TopicController()
        {
            _topicSvc = new TopicService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetTopic()
        {
            List<TopicDE> list = new List<TopicDE>();
            list = _topicSvc.SearchTopic(new TopicDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchTopic(TopicDE topic)
        {
            List<TopicDE> list = _topicSvc.SearchTopic(topic);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetTopicById(int id)
        {
            List<TopicDE> list = new List<TopicDE>();
            list = _topicSvc.SearchTopic(new TopicDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostTopic(TopicDE topic)
        {
            topic.DBoperation = DBoperations.Insert;
            _topicSvc.ManageTopic(topic);
            return Ok();
        }

        [HttpPut]
        public IActionResult PutTopic(TopicDE topic)
        {
            topic.DBoperation = DBoperations.Update;
            _topicSvc.ManageTopic(topic);
            return Ok();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteTopic(int id)
        {
            TopicDE topicDe = new TopicDE();
            topicDe.DBoperation = DBoperations.Delete;
            topicDe.Id = id;
            _topicSvc.ManageTopic(topicDe);
            return Ok();
        }
    }
}
