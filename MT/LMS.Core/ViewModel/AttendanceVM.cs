using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.ViewModel
{
    public class AttendanceVM : BaseViewModel
    {

        //public DateTime? from { get; set; }
        //public DateTime? to { get; set; }
        public string? UserId { get; set; }
        public string? User { get; set; }
        public string? InTime { get; set; }
        public string? OutTime { get; set; }
        public DateTime? ScheduleTime { get; set; }
        public string? WorkedHours { get; set; }
        public DateTime? Date { get; set; }
     

    }
}
