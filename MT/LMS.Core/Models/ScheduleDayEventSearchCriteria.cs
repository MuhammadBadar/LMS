using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Models
{
    public class ScheduleDayEventSearchCriteria : BaseSearchCritia
    {
        //public int Id { get; set; }
        public int SchId { get; set; }
        public int SchDayId { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public  int LocationId { get; set; }
        //public int EventTypeId { get; set; }    
        //public bool IsActive { get; set; }
    }
}
