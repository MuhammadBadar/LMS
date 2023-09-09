using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.SearchCriteria
{
    public class LectureSearchCriteria:BaseSearchCriteria
    {
        public int TopicId { get; set; }
        public string? Title { get; set; }
        public string? Description { get; set; }
        public string? LectureURL { get; set; }
    }
}
