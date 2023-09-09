using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.Entities
{
    public class AttendanceDE:BaseDomain
    {
        public string? UserId { get; set; }
        public DateTime? InTime { get; set; }
        public DateTime? OutTime { get; set; }
        public string? WorkingHours { get; set; }
        public string? UserName { get; set; }
       

        public AttendanceDE()
        {
          this.InTime = DateTime.Now;
           
        }
    }
}
