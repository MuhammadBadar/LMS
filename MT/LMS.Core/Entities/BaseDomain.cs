using LMS.Core.Enums;

namespace LMS.Core.Entities
{
    public abstract class BaseDomain
    {
        #region Class Properties
        public int Id { get; set; }
        public bool IsActive { get; set; }
        public DBoperations DBoperation { get; set; }
        public int CreatedById { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int ModifiedById { get; set; }
        public DateTime ModifiedOn { get; set; }
        #endregion
        #region Constructors
        public BaseDomain()
        {
            DBoperation = new DBoperations();
            this.CreatedOn = DateTime.Now;
            this.ModifiedOn = DateTime.Now;
            this.IsActive = true;
        }
        #endregion
    }
}
