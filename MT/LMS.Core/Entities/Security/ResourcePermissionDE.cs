
using LMS.Core.Enums;

namespace LMS.Core.Entities.Security
{
    public class ResourcePermissionDE : BaseDomain
    {
        public ResourcePermissionDE()
        {
            Actions = new List<PermissionActions>();
        }
        public int FeatureId { get; set; }
        public string Feature { get; set; }
        public int? UserId { get; set; }
        public string User { get; set; }
        public int? RoleId { get; set; }
        public string Role { get; set; }
        public int ResourceId { get; set; }
        public string Resource { get; set; }
        public List<PermissionActions> Actions { get; set; }
    }

    public class ResourcePermissionsList
    {
        public ResourcePermissionsList()
        {
            ResourcePermissions = new List<ResourcePermissionDE>();

            // Role Level Permissions
            ResourcePermissions.Add(new ResourcePermissionDE
            {
                Id = 1,
                FeatureId = 1,
                RoleId = 1,
                Role = "PSE",
                ResourceId = 1,
                Resource = "/Department/*"
                ,
                Actions = new List<PermissionActions> { PermissionActions.Read, PermissionActions.Write }
            });
            ResourcePermissions.Add(new ResourcePermissionDE
            {
                Id = 2,
                FeatureId = 1,
                RoleId = 2,
                Role = "SSE",
                ResourceId = 1,
                Resource = "/Department/*"
                ,
                Actions = new List<PermissionActions> { PermissionActions.Read, PermissionActions.Write }
            });
            ResourcePermissions.Add(new ResourcePermissionDE { Id = 3, FeatureId = 1, RoleId = 3, Role = "SE", ResourceId = 1, Resource = "/Department/*", Actions = new List<PermissionActions> { PermissionActions.Read } });
            ResourcePermissions.Add(new ResourcePermissionDE { Id = 4, FeatureId = 1, RoleId = 4, Role = "JSE", ResourceId = 1, Resource = "/Department/*", Actions = new List<PermissionActions> { PermissionActions.Read } });
            ResourcePermissions.Add(new ResourcePermissionDE { Id = 5, FeatureId = 1, RoleId = 5, Role = "INTERN", ResourceId = 1, Resource = "/Department/*", Actions = new List<PermissionActions> { PermissionActions.Read } });

            // User Level Permissions
            ResourcePermissions.Add(new ResourcePermissionDE { Id = 6, UserId = 3, User = "Asgher", ResourceId = 1, Resource = "/departments/*", Actions = new List<PermissionActions> { PermissionActions.Write } });
        }

        public List<ResourcePermissionDE> ResourcePermissions { get; set; }
    }
}