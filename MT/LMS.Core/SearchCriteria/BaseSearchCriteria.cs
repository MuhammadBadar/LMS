using LMS.Core.Enums;

namespace LMS.Core.SearchCriteria
{
    public abstract class BaseSearchCriteria
    {
        public DBoperations DBoperation { get; set; }
        public int Id { get; set; }
        public bool IsActive { get; set; }

    }
}
