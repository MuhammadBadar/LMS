using QST.MicroERP.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.SearchCriteria
{
   public abstract class BaseSearchCriteria
    {
        public DBoperations DBoperation { get; set; }
        public int Id { get; set; }
        public bool IsActive { get; set; }
         
    }
}
