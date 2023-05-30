using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class CourseDetailDE:BaseDomain
    {
        public string? ProjectTitle { get; set; }
        public string? ProjectLogoBase64Path { get; set; }
        public string? ProjectKeyPoints { get; set; }
        public string? ReasonToJoin { get; set; }
        public string? CourseCurriculum { get; set; }
        public string? IconBase64Path { get; set; }
        public string? Title { get; set; }
        public string? ShortDetail { get; set; }
    }
}
