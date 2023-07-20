using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class StudentDE : BaseDomain
    {
        public int? CityId { get; set; }
        public string? City { get; set; }
        public int? TopicId { get; set; }
        public string? Topic { get; set; }
        public string? Name { get; set; }
        public string? Email { get; set; }

    }
}
