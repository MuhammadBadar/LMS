using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.ViewModel
{
    public class UsertaskbydateVM : BaseViewModel
    {

        public string? UserName { get; set; }
        public DateTime? Date { get; set; }
        public string? TaskDetails { get; set; }
        public string? StoryPoints { get; set; }
        public double? TotalSP { get; set; }
        public decimal? TotalDayEndStatus { get; set; }
    }
}
