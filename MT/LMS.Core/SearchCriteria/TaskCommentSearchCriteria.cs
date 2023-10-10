using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.SearchCriteria
{
   public class TaskCommentSearchCriteria : BaseSearchCriteria
    {
        public string? TaskTitle { get; set; }
        public int TaskId { get; set; }
        public string? User { get; set; }
        public string? Comment { get; set; }
        public TaskCommentSearchCriteria()
        {
            IsActive = true;
        }
    }
}
