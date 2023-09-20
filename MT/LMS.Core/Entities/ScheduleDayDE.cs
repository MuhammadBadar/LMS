using LMS.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class ScheduleDayDE : BaseDomain
    {
        public ScheduleDayDE() 
        {
            ScheduleDayEvents = new List<ScheduleDayEventDE>();
        }

        #region Class Properties        
        public int? DayId { get; set; }
        public int SchId { get; set; }

        #endregion

        public string? Day { get; set; }

        public List<ScheduleDayEventDE> ScheduleDayEvents{ get; set; }

    }
}
