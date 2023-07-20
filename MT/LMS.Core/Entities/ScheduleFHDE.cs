using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class ScheduleFHDE:BaseDomain
    {
        public int? UserId { get; set; }
        public int? RoleId { get; set; }
        public string? User { get; set; }
        public string? ScheduleType { get; set; }
        public string? WorkingFor { get; set; }
        public string? WorkingHours { get; set; }
    }
}
