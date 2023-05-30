using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class CourseDE:BaseDomain
    {
        public string? Title { get; set; }
        public string? ShortDescription { get; set; }
        public string? LogoBase64Path { get; set; }
        public int Fee { get; set; }
    }
}
