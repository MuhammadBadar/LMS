using QST.MicroERP.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.ViewModel
{
    public class FieldVM:BaseViewModel
    {
        public List<FieldPossibleValuesDE> FPV { get; set; }
        public int TypeId { get; set; }
        public string? Title { get; set; }
        public bool IsRequired { get; set; }
        public string? Type { get; set; }
        public FieldVM()
        {
            this.FPV = new List<FieldPossibleValuesDE>();
        }
    }
}
