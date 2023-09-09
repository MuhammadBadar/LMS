using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.Entities
{
    public class InquiryFieldDataDE:BaseDomain
    {
        public int InquiryId { get; set; }
        public string? FieldName { get; set; }
        public string? FieldValue { get; set; }
    }
}
