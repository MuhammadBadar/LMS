using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.ViewModel
{
    public class TaskVM : BaseViewModel
    {


        public string? User { get; set; }
        public string? Priority { get; set; }
        public string? Status { get; set; }
        public string? Module { get; set; }
        public string? TaskTitle { get; set; }
        public string? StoryPoints { get; set; }
        public double? SPs { get; set; }
        public DateTime? Date { get; set; }
        public int? DayEndStatus { get; set; }



    }
}