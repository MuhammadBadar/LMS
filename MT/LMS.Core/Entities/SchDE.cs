using LMS.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class SchDE : BaseDomain
    {


        #region Class Properties
        
        public string? UserId { get; set; }
        public string? RoleId { get; set; }
        public int? ScheduleTypeId { get; set; }
        public DateTime? EffectiveDate { get; set; }

        public List<SchLineDE> SchLine { get; set; }


        #region View Properties

        public string? User { get; set; }
        public string? Role { get; set; }
        public string? ScheduleType { get; set; }
        
        #endregion

        #endregion
        public SchDE()
        {
            this.SchLine = new List<SchLineDE>();
        }
    }
}
