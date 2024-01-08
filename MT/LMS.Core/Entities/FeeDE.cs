using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace LMS.Core.Entities
{
    public class FeeDE : BaseDomain
    {
        public FeeDE()
        {
            FeeLines = new List<FeeLineDE>();
        }

        // Add the ForeignKey attribute if needed
        [ForeignKey("FeeId")]
        public List<FeeLineDE> FeeLines { get; set; }

        public int? StudentId { get; set; }
        //public string Student { get; set; }
        public DateTime FeeDate { get; set; }
        public int? Amount { get; set; }
        public int NetAmount { get; set; }
        public int? Concession { get; set; }

        
    }
}
