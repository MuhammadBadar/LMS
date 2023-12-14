
using LMS.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.SearchCriteria
{
   public class TaskSearchCriteria:BaseSearchCriteria
    {
        public int TaskId { get; set; }
        public int ClaimId { get; set; }
        public float SP { get; set; }
        public DateTime Date { get; set; }
        public string? TaskPriority { get; set; }
        public int PriorityId { get; set; }
        public string? UserId { get; set; }
        public int ModuleId { get; set; }
        public int StatusId { get; set; }
        public string? User { get; set; }
        public string? Module { get; set; }
        public string? TaskStatus { get; set; }
        public string? Status { get; set; }
        public string? Title { get; set; }
        public bool? IsDayEnded { get; set; }
        //public int SP { get; set; }
        public string? Description { get; set; }
        public List<AttachmentsDE> Attachments { get; set; }
        public TaskSearchCriteria()
        {
            this.Attachments = new List<AttachmentsDE>();
        }

    }
}
