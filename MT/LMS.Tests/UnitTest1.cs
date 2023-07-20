using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Service;
using NUnit.Framework;
using System.Collections.Generic;

namespace LMS.Tests
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }
         [Test]
         public void Service_Topic_Crud()
        {
          TopicService _topicSvc =new TopicService();
          TopicDE topic = new TopicDE();
          List<TopicDE> topics = new List<TopicDE>();
            #region Delete
            topics = _topicSvc.SearchTopic(new TopicDE());
            foreach (var val in topics)
            {
                val.DBoperation = DBoperations.Delete;
                _topicSvc.ManageTopic(val);
            }
            topics = _topicSvc.SearchTopic(new TopicDE());
            Assert.AreEqual(0, topics.Count);
            #endregion
            #region Insert
            topic = new TopicDE
            {
                TopicTitle = "Oop",
                Description = "DES....",
                DBoperation = DBoperations.Insert,
                IsActive = true
            };
            Assert.IsTrue(_topicSvc.ManageTopic(topic));
            topics = _topicSvc.SearchTopic(new TopicDE());
            Assert.AreEqual(1, topics.Count);

            topic = new TopicDE
            {
                TopicTitle = "Java",
                Description = "DES....",
                DBoperation = DBoperations.Insert,
                IsActive = true
            };
            Assert.IsTrue(_topicSvc.ManageTopic(topic));
            topics = _topicSvc.SearchTopic(new TopicDE());
            Assert.AreEqual(2, topics.Count);
            #endregion
            #region Update

            topics = _topicSvc.SearchTopic(new TopicDE());
            topics[0].TopicTitle = "Android";
            topics[0].DBoperation = DBoperations.Update;
            topics[0].Id = 1;
            _topicSvc.ManageTopic(topics[0]);
            topics = _topicSvc.SearchTopic(new TopicDE());
            Assert.AreEqual("Android", topics[0].TopicTitle);

            #endregion
            #region DeActivate

            topics = _topicSvc.SearchTopic(new TopicDE());
            topics[0].IsActive = false;
            topics[0].DBoperation = DBoperations.Update;
            topics[0].Id = 1;
            _topicSvc.ManageTopic(topics[0]);
            topics = _topicSvc.SearchTopic(new TopicDE());
            Assert.AreEqual(false, topics[0].IsActive);

            #endregion
            #region Activate

            topics = _topicSvc.SearchTopic(new TopicDE());
            topics[0].IsActive = true;
            topics[0].DBoperation = DBoperations.Update;
            topics[0].Id = 1;
            _topicSvc.ManageTopic(topics[0]);
            topics = _topicSvc.SearchTopic(new TopicDE());
            Assert.AreEqual(true, topics[0].IsActive);

            #endregion
            #region Search

            topic = new TopicDE { Id = 1 };
            topics = _topicSvc.SearchTopic(topic);
            Assert.AreEqual("Android", topics[0].TopicTitle);
            Assert.AreEqual(true, topics[0].IsActive);

            topic = new TopicDE {TopicTitle= "Android" };
            topics = _topicSvc.SearchTopic(topic);
            Assert.AreEqual(1, topics[0].Id);
            Assert.AreEqual(true, topics[0].IsActive);

            #endregion
        }



    }
}