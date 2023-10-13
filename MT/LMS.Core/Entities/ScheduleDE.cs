using LMS.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class ScheduleDE:BaseDomain
    {

        public ScheduleDE()
        {
            DayIds = new List<int>();
            ScheduleDays = new List<ScheduleDayDE>();
        }

        #region Class Properties
        public List<int>? DayIds { get; set; }
        public string? UserId { get; set; }
        public string? RoleId { get; set; }
        public int? EntityId { get; set; }
        public int? ScheduleTypeId { get; set; }
        public int? WorkingTypeId { get; set; }
        public string? WorkingHours { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public DateTime? EffectiveDate { get; set; }
        public List<ScheduleDayDE> ScheduleDays{ get; set; }


        #region View Properties

        public string? User { get; set; }
        public string? Role { get; set; }
        public string? Entity { get; set; }
        public string? ScheduleType { get; set; }
        public string? WorkingType { get; set; }

        #endregion

        #endregion
        //public ScheduleDE()
        //{
        //    this.ScheduleDays = new List<ScheduleDayDE>();
        //    /*this.ScheduleDays = new List<ScheduleDayDE>();*/
        //}

        
    }
}
