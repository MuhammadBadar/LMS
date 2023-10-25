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

        public string? Name { get; set; }
        public string? Title { get; set; }
    }
}
