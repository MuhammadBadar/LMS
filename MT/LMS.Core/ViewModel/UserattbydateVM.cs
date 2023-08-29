using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.ViewModel
{
    public class UserattbydateVM : BaseViewModel
    {
       
        public string? User { get; set; }
        public DateTime? Date { get; set; }
        public string? AttendanceDetails { get; set; }
        public string? TotalWorkedHours { get; set; }


    }
}
