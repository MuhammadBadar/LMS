
using LMS.Core.Enums;

namespace LMS.Core.ViewModel
{
    public abstract class BaseViewModel
    {
        public int Id { get; set; }
        public bool IsActive { get; set; }
        public DateTime DateTo { get; set; }
        public DateTime DateFrom { get; set; }
        public int CreatedById { get; set; }
        public DateTime CreatedOn { get; set; }
        public int ModifiedById { get; set; }
        public DateTime ModifiedOn { get; set; }
        public DBoperations DBoperation { get; set; }

    }
}
