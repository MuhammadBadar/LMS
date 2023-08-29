using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.ViewModel
{
    public class AttendanceVM : BaseViewModel
    {

        public string? User { get; set; }
        public string? InTime { get; set; }
        public string? OutTime { get; set; }
        public string? WorkedHours { get; set; }
        public DateTime? Date { get; set; }
     

    }
}
