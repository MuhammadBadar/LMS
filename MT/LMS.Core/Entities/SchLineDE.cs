using LMS.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class SchLineDE : BaseDomain
    {


        #region Class Properties        
        public int? DayId { get; set; }
        public int SchId { get; set; }

        #endregion

        public string? Day { get; set; }


    }
}
