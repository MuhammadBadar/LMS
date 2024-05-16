using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.Core.Entities;
using Restaurant.Core.Entities.Acc;
using Restaurant.Core.Constants;

namespace Restaurant.DAL.Acc
{
    public interface IAccDAL
    {
        public bool ManageChartOfAccount ( ChartOfAccountDE mod, MySqlCommand? cmd=null );
        public List<ChartOfAccountDE> SearchChartOfAccount ( string WhereClause, MySqlCommand? cmd=null, int PageNo=1, int PageSize=AppConstants.GRID_MAX_PAGE_SIZE );

    }
}
