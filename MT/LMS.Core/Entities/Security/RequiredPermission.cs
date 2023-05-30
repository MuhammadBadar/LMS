using LMS.Core.Enums;

namespace LMS.Core.Entities.Security
{
    public class RequiredPermission
    {
        public RequiredPermission(string resourceId, PermissionActions action)
        {
            ResourceId = resourceId;
            Action = action;
        }

        public string ResourceId { get; }

        public PermissionActions Action { get; }
    }
}
