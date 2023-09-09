using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.ViewModel
{
    public class ExpenseVM:BaseViewModel
    {
        public int ExpenseTypeId { get; set; }
        public string? ExpenseTitle { get; set; }
        public string? ExpenseDetail { get; set; }
        public DateTime ExpenseDate { get; set; }
        public string? ExpenseType { get; set; }
        public string? ExpenseComment { get; set; }
    
}
}
