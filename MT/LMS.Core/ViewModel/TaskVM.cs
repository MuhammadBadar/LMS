
using LMS.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.ViewModel
{
    public class UserTaskVM:BaseViewModel
    {
        public string? User { get; set; }
        public string? Module { get; set; }
        public string? Status { get; set; }
        public int StatusId { get; set; }
        public string? Priority { get; set; }
        public int PriorityId { get; set; }
        public string? UserId { get; set; }
        public int ModuleId { get; set; }
        public string? Title { get; set; }
        public string? UserPhoneNumber { get; set; }
        public string? DirectSupervisorPhoneNumber { get; set; }
        public float SP { get; set; }
        public string? Description { get; set; }
        public string? DirectSupervisorId { get; set; }
        public string? UserMail { get; set; }
        public string? DirectSupervisorEmail { get; set; }
        public string? DirectSupervisorName { get; set; }
        public List<AttachmentsDE> Attachments { get; set; }
        public int ClaimPercent { get; set; }
        public float RemainingSPs { get; set; }
        public UserTaskVM()
        {
            this.Attachments = new List<AttachmentsDE>();
        }
    }
}
