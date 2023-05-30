using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class ClassTimingDE:BaseDomain
    {
        public int SchId { get; set; }
        public int WeekDayId { get; set; }
        public string? TimeTo { get; set; }
        public string? TimeFrom { get; set; }
        public string? WeekDay { get; set; }
    }
}
