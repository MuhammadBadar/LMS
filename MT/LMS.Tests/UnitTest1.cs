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
        [Test]
        public void Service_Vocabulary_CRUD()
        {
            VocabularyService vcbSvc = new VocabularyService();

            //var list = new List<CourseDE>();
            //list = crsSvc.SearchCourse();

            var vcb = new VocabularyDE();
            vcb.Id = 1;
            vcb.Word = "xxxxxxyz";
            vcb.Meaning = "Related to";
            vcb.Reference = "from book Zety pg";
            vcb.Sentance = "this referancwe is for creating a cv";
            vcb.Pronunciation = "aaaaaassssddd";
            vcb.Translation = "urdu  meaning";

            //crs.DBoperation = DBoperations.Update;
            vcb.DBoperation = DBoperations.Insert;

            vcbSvc.ManageVocabulary(vcb);
        }

        [Test]
        public void Service_City_CRUD()
        {
            CityService ctySvc = new CityService();

            //var list = new List<CourseDE>();
            //list = crsSvc.SearchCourse();

            var cty = new CityDE();
            cty.Id = 1;
            cty.Name = "Lahoreeeee";


            //crs.DBoperation = DBoperations.Update;
            cty.DBoperation = DBoperations.Insert;

            ctySvc.ManageCity(cty);
        }
        [Test]
        public void Service_Student_CRUD()
        {
            StudentService stdSvc = new StudentService();

            //var list = new List<CourseDE>();
            //list = crsSvc.SearchCourse();

            var std = new StudentDE();
            //std.Id = 1;
            //std.Name = "Miss Sana";
            //std.CityId = 1;
            //std.City = "pakistann";
            //std.Email = "SanaJawed@gmail.com";
            ////crs.DBoperation = DBoperations.Update;
            //std.DBoperation = DBoperations.Insert;

            stdSvc.ManageStudent(std);
        }
        [Test]
        public void Service_CityStudent_CRUD()
        {
            CityStudentService ctystdSvc = new CityStudentService();

            //var list = new List<CourseDE>();
            //list = crsSvc.SearchCourse();

            var ctystd = new CityStudentDE();
            ctystd.Id = 1;

            ctystd.CityId = 1;
            ctystd.StudentId = 1;
            ctystd.City = "Lahore";
            ctystd.Student = "sana";


            //crs.DBoperation = DBoperations.Update;
            ctystd.DBoperation = DBoperations.Insert;

            ctystdSvc.ManageCityStudent(ctystd);
        }
        //[Test]
        //public void Service_ScheduleFH_CRUD()
        //{
        //    ScheduleFHService schSvc = new ScheduleFHService();

        //    //var list = new List<CourseDE>();
        //    //list = crsSvc.SearchCourse();

        //    var sch = new ScheduleFHDE();
        //    sch.Id = 1;
        //    sch.UserId = 2;
        //    sch.User = "Related to";
        //    sch.RoleId = 1;
        //    sch.ScheduleType = "FH";
        //    sch.WorkingFor = "Week";
        //    sch.WorkingHours = "10 Hours";

        //    //crs.DBoperation = DBoperations.Update;
        //    sch.DBoperation = DBoperations.Insert;

        //    schSvc.ManageScheduleFH(sch);
        //}
    }
}

