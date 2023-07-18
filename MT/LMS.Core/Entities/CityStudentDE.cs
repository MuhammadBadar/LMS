using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class CityStudentDE: BaseDomain
    {
        public int StudentId { get; set; }
        public int CityId { get; set; }
        public string? Student { get; set; }
        public string? City { get; set; }

    }
}
