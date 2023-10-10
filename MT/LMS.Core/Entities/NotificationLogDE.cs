using LMS.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class NotificationLogDE: BaseDomain
    {
        public string? UserId { get; set; }
        public string? Phone { get; set; }
        public DateTime DateTime { get; set; }
        public bool IsSent { get; set; }
        public string? SMS { get; set; }
       public NotificationLogDE()
        {
            this.IsSent = false;
            this.DateTime = DateTime.Now;
        }

    }
}
