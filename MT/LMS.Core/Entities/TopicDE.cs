using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class TopicDE:BaseDomain
    {
        public string? TopicTitle { get; set; }
        public string? Description { get; set; }
    }
}
