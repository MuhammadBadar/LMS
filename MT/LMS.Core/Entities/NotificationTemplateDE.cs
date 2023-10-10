using LMS.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class NotificationTemplateDE:BaseDomain
    {
        public string? KeyCode { get; set; }
        public string? TemplateName { get; set; }
        public string? Body { get; set; }
        public string? Subject { get; set; }
        public string? SMS { get; set; }
      
    }
}
