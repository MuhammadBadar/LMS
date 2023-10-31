using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class UserTaskDE:BaseDomain
    {
        public string UserId { get; set; }
        public int TaskId { get; set; }
        public string? Title { get; set; }


        public string? User { get; set; }

        public string? Parent { get; set; }
        public DateTime Date { get; set; }

        public string? Claim { get; set; }
        public string? Comments { get; set; }
        public string? ReviewedBy { get; set; }

        public string? ReviewComments { get; set; }

    }
}
