using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace QST.MicroERP.Core.Entities
{
    public class TaskDE :BaseDomain
    {
        public string? UserId { get; set; }
        public int ModuleId { get; set; }
        public int StatusId { get; set; }
        public int PriorityId { get; set; }
        public string? Title { get; set; }
        public float SP { get; set; }
        public string? DirectSupervisorId { get; set; }
        public string? Description { get; set; }
        public List<AttachmentsDE> Attachments { get; set; }
        public TaskDE()
        {
            this.Attachments = new List<AttachmentsDE>();
        }
    }
   
}
