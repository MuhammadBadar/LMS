using QST.MicroERP.Core.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.ViewModel
{
    public class TaskCommentVM:BaseViewModel
    {
        public int TaskId { get; set; }
        public string? TaskTitle { get; set; }
        public string? User { get; set; }
        public string? UserId { get; set; }
        public string? Comment { get; set; }
        public DateTime Datetime { get; set; }
    }
}
