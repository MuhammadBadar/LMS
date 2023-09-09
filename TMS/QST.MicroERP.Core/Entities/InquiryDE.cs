
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.Entities
{
    public class InquiryDE:BaseDomain
    {
        public List<InquiryFieldDataDE> IFData { get; set; }
        public string? Name { get; set; }
        public string? Cell { get; set; }
        public string? Comments { get; set; }
        public int ServicesId { get; set; }
        public string? ServiceName { get; set; }
        public string? Content { get; set; }
        public string? Email { get; set; }
        public InquiryDE()
        {
            this.IFData = new List<InquiryFieldDataDE>();
        }
    }
}
