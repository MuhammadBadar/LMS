
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
   public class AttachmentsDE : BaseDomain
    {
        public int TaskId { get; set; }
        public string? DocPath { get; set; }
        public string? Name { get; set; }
        public string? Size { get; set; }
        public string? Base64File { get; set; }
    }
}
