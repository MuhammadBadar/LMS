using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class GuardianschoolDE : BaseDomain
    {
        public string? Name { get; set; }
        public string? Cnic { get; set; }
        public string? Address { get; set; }
        public string? Cell1 { get; set; }
        public string? Cell2 { get; set; }
        public string? Cell3 { get; set;}
        public string? Email { get; set; }
        public string? Whatsapp { get; set; }
    }
}
