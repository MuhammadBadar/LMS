using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class FeeDE : BaseDomain
    {
        
        public int? StudentId { get; set; }
        public DateTime FeeDate { get; set; }   
        public int? Amount { get; set; }
        public string? Concession { get; set; }        

    }
}
