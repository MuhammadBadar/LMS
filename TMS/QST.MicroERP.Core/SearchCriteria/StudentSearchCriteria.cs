using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.SearchCriteria
{
    public class StudentSearchCriteria:BaseSearchCriteria
    {
        public string? StudentName { get; set; }
        public char Gender { get; set; }
        public string? CNIC { get; set; }
        public DateTime DOB { get; set; }
        public string? CellNo { get; set; }
        public string? Email { get; set; }
        public string? WhatsApp { get; set; }
        public string? GuardianName { get; set; }
        public string? GuardianCell { get; set; }
        public string? GuardianRelation { get; set; }
        public string? UserName { get; set; }
        public string? Password { get; set; }
        public string? GuardianWhatsApp { get; set; }
        public string? GuardianEmail { get; set; }
    }
}
