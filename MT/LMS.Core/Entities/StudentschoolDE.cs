using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class StudentschoolDE : BaseDomain
    {   public int GuardianschoolId { get; set; }
        public string? Name { get; set; }
        public string? AdmissionDate { get; set; }
        public string? LeftDate { get; set; }
        public string? Gender { get; set; }
        public string? Dateofbirth { get; set; }
    }
}
