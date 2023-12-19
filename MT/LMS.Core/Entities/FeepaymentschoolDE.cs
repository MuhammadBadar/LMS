using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class FeepaymentschoolDE : BaseDomain
    {
        public string? RegNo { get; set; }
        public string? Student { get; set; }
        public int? StudentschoolId { get; set; }
        public int? ClassId { get; set; }
        public string? Branch { get; set; }
        public string? Class { get; set; }
        public string? ContactNo { get; set; }
        public string? Amount { get; set; }
        public string? Concession { get; set; }
        public string? PayableAmount { get; set; }
        public int? SectionId { get; set; }
        public string? Section { get; set; }
        public int? FeetypeschoolId { get; set; }
        public string? Feetype { get; set; }

    }
}
