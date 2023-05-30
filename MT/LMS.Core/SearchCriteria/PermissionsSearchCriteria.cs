namespace LMS.Core.SearchCriteria
{
    public class PermissionsSearchCriteria : BaseSearchCriteria
    {
        public string? UserId { get; set; }
        public string? RoleId { get; set; }
        public string? User { get; set; }
        public string? Role { get; set; }
        public int? FeatureId { get; set; }
        public string? Feature { get; set; }
        public int? PermissionValue { get; set; }
        public string? Permission { get; set; }
    }
}
