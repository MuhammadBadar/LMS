using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace LMS.Core.ViewModel
{
    public class UserreportVM: BaseViewModel
    {
        public string? UserId { get; set; }
        public string? UserName { get; set; }
        public string? Day { get; set; }
        public DateTime? Date { get; set; }
        public string? InTimeOutTime { get; set; }
        public double? ScoreSPs { get; set; }
        public string? TodaysTargets { get; set; }
         public string? WorkTime { get; set; }
        public string? DueTime { get; set; }
        public string? OverTime { get; set; }
        public string? MissingTime { get; set; }
        public string? ScheduleTime { get; set; }
        public string? StoryPoints { get; set; }
        public double? DueSps { get; set; }
        public double? SPsGap { get; set; }
        public string? DayEndStatus { get; set; }
    }
}
