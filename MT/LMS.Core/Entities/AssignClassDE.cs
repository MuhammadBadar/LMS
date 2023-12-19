using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class AssignClassDE : BaseDomain
    {
        public int? StudentschoolId { get; set; }
        public string? Student { get; set; }
        public string? Dateofassignment { get; set; }
        public string? Effectivedate { get; set; }
        public int? ClassId { get; set; }
        public string? Class { get; set; }
        public int? SectionId { get; set; }
        public string? Section { get; set; }
        public string? Branch { get; set; }
        public int? BranchId { get; set; }
    }
}
