using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class SchoolDE : BaseDomain
    {
        public string? Name { get; set; }
        public string? Address { get; set; }
        public string? ContactPerson { get; set; }
        public string? CellNo { get; set; }
    }
}
