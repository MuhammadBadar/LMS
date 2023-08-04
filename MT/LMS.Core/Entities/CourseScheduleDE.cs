using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class CourseScheduleDE:BaseDomain
    {
        public string? LogoBase64Path { get; set; }
        public int CourseId { get; set; }
        public string? Description { get; set; }
        public DateTime? OrientationClass { get; set; }
        public DateTime? StartDate { get; set; }
        public List<ClassTimingDE> ClassTimings { get; set; }
        public string? Course { get; set; }
        public CourseScheduleDE()
        {
            this.ClassTimings = new List<ClassTimingDE>();
        }
    }
}
