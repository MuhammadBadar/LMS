using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace QST.MicroERP.Core.Entities
{
    public class StudentLecturesDE:BaseDomain
    {
        public string? UserName { get; set; }
        public string? Password { get; set; }
        public string? Description { get; set; }
        public string? Title { get; set; }
        public string? Student { get; set; }
        public string? Lecture { get; set; }
        public int StudentId { get; set; }
        public int LectureId { get; set; }
        public DateTime AssignedOn { get; set; }
    }
}
