using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class LectureDE : BaseDomain
    {

        public int TopicId { get; set; }
        public int CourseId { get; set; }
        public string? TopicTitle { get; set; }


        public string? Course { get; set; }

        public string? Title { get; set; }

        public string? Description { get; set; }
        public string? URL { get; set; }

    }
}