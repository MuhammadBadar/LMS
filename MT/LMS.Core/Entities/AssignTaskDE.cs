using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class AssignTaskDE : BaseDomain
    {
        public int LectureId { get; set; }
        public int StudentId { get; set; }
        public int TopicId { get; set; }
        public int CourseId { get; set; }

        public string? Course { get; set; }

        public string? Student { get; set; }
        public string? Topic { get; set; }
        public string? Lecture { get; set; }
    }
}
