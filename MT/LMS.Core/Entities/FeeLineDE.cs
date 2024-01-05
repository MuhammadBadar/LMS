using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class FeeLineDE : BaseDomain
    {
        public int FeeId { get; set; }
        public int? FeeTypeId { get; set; }        
        public int? FeeAmount { get; set; }
        public int? Concession { get; set; }

    }
}
