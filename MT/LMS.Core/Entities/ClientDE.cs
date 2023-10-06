using LMS.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class ClientDE : BaseDomain
    {
        public string? ClientName { get; set; }        
        public string? Cnic { get; set; }
        public string? Cell { get; set; }
        public string? Address { get; set; }
        public string? Email { get; set; }
        public DateTime? JoiningDate { get; set; }

    }
}
