using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities.Acc
{
    public class ChartOfAccountDE : BaseDomain
    {
        #region Properties

        public int CoaLevelId { get; set; }
        public int CoaTypeId { get; set; }
        public string? CoaCode { get; set; }
        public int ParentCoaId { get; set; }
        public string? CoaDesc { get; set; }

        #endregion
        #region View Properties

        public string? CoaType { get; set; }
        public string? CoaLevel { get; set; }
        public string? ParentCoaDesc { get; set; }
        public string? ParentCoaCode { get; set; }

        #endregion
    }
}
