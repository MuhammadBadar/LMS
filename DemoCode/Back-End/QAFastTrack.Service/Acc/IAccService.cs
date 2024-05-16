using Restaurant.Core.Entities.Acc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service.Acc
{
    public interface IAccService
    {
        public ChartOfAccountDE ManageChartOfAccount ( ChartOfAccountDE mod );
        public List<ChartOfAccountDE> SearchChartOfAccount ( ChartOfAccountDE mod );
        public List<ChartOfAccountDE> GetAccounts ( ChartOfAccountDE mod );

    }
}
