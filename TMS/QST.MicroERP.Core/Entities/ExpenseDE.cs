using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.Entities
{
    public class ExpenseDE:BaseDomain
    {
        public int ExpenseTypeId { get; set; }
        public string? ExpenseTitle { get; set; }
        public string? ExpenseDetail { get; set; }
        public DateTime? ExpenseDate { get; set; }
        public  ExpenseDE(){
            this.ExpenseDate = DateTime.Now;
        }

    }
}
