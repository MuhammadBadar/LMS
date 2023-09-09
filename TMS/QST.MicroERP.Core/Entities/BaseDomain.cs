using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.Entities
{
    public abstract class BaseDomain  
    {
        #region Class Properties
        public int Id { get; set; }
        public bool IsActive { get; set; }
        public  DBoperations DBoperation { get; set; }
        public int CreatedById { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int ModifiedById { get; set; }
        public DateTime ModifiedOn { get; set; }
        #endregion
        #region Constructors
        public bool HasErrors { get; set; }
        public BaseDomain()
        {
            DBoperation  = new DBoperations();
            this.CreatedOn = DateTime.Now;
            this.IsActive = true;
        }
        #endregion
    }
}
