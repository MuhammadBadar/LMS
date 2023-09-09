
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.Entities
{
   public class FieldDE : BaseDomain
    {
        public List<FieldPossibleValuesDE> FPV { get; set; }
        public int TypeId { get; set; }
        public bool IsRequired { get; set; }
        public string? Title { get; set; }
        public FieldDE()
        {
            this.FPV = new List<FieldPossibleValuesDE>();
        }
    }
}
