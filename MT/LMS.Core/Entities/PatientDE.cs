using LMS.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class PatientDE : BaseDomain
    {
        public string? PatientName { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string? Gender { get; set; }
        public string? ContactNo { get; set; }
        public string? HouseNo { get; set; }
        public string? Address { get; set; }
        public string? Remarks { get; set; }


    }
}
