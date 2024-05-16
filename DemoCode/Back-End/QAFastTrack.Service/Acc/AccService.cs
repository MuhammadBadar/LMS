using Restaurant.DAL.Acc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service.Acc
{
    public partial class AccService : BaseService, IAccService
    {
        #region Class Variables

        public IAccDAL _accDAL;

        #endregion
        #region Constructor

        public AccService (IAccDAL accDAL )
        {
            _accDAL = accDAL;
        }

        #endregion
    }
}
