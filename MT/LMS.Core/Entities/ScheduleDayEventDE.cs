using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class ScheduleDayEventDE : BaseDomain
    {
       
        public string? StartTime { get; set; }
        public string? EndTime { get; set; }
        public int SchId { get; set; }
        public int EventTypeId { get; set; }
        public int LocationId { get; set; }
        public int? ScheduleDayId { get; set; }

        #region View Properties

        public string? EventType { get; set; }
        public string? Location { get; set; }
        public string? Day { get; set; }
        // Add SchedulePoints property
        public float SchedulePoints { get; set; }

        #endregion


    }
}
