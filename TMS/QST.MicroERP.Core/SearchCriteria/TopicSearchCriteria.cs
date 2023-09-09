using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.SearchCriteria
{
    public class TopicSearchCriteria:BaseSearchCriteria
    {
        public string? Title { get; set; }
        public string? Description { get; set; }
    }
}
