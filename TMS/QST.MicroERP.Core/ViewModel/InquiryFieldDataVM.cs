using QST.MicroERP.Core.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.Entities
{
    public class InquiryFieldDataVM:BaseViewModel
    {
        public int InquiryId { get; set; }
        public string? FieldName { get; set; }
        public string? FieldValue { get; set; }
        public int FieldId { get; set; }
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Cell { get; set; }
        public int ServicesId { get; set; }
        public string? ServiceName { get; set; }
    }
}
