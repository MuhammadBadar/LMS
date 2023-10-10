using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class TaskCommentDE:BaseDomain
    {
        public TaskCommentDE()
        {
            User = String.Empty;
        }

        public int TaskId { get; set; }
        public string? UserId { get; set; }
        public string? User { get; set; }
        public string? Comment { get; set; }
        public DateTime Time { get; set; }

    }
}
