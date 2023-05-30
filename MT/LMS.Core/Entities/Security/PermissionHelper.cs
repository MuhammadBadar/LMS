using LMS.Core.Entities.Security;
using LMS.Core.Enums;
using System.Security.Claims;
using System.Text.Json;
using System.Text.RegularExpressions;

namespace LMS.Core.Entities.Security
{
    public static class PermissionHelper
    {
        private static bool MatchesPermission(ResourcePermissionDE permission, string specificResourceId, PermissionActions requiredAction)
        {
            if (!permission.Actions.Contains(requiredAction))
            {
                return false;
            }

            var requiredResourceId = specificResourceId.Split('/');
            var permissionResourceId = permission.Resource.Split('/');

            for (var i = 0; i < requiredResourceId.Length; i++)
            {
                if (permissionResourceId.Length <= i)
                {
                    return false;
                }


                if (permissionResourceId[i] == "**")
                {
                    return true;
                }

                if (permissionResourceId[i] != "*" && permissionResourceId[i] != requiredResourceId[i])
                {
                    return false;
                }
            }

            if (permissionResourceId.Length != requiredResourceId.Length)
            {
                return false;
            }

            return true;
        }

        private static readonly Regex Regex = new Regex("{(.*?)}", RegexOptions.Compiled);

        public static bool IsMetByPermissions(this IAuthorizePolicy policy, ResourcePermissionsList permissions, Dictionary<string, string?> paramMap)
        {
            //permissions.ResourcePermissions
            foreach (var requiredPermission in policy.Permissions)
            {
                var specificResourceId = requiredPermission.ResourceId;

                // replacing the parameters in the required permission resoruce id
                var matches = Regex.Matches(requiredPermission.ResourceId).ToList();
                foreach (var match in matches)
                {
                    var parameterName = match.Groups[1].Value;
                    //var parameterName = match.Groups[0].Value;
                    if (!paramMap.ContainsKey(parameterName))
                    {
                        throw new ArgumentException($"Parameter with name {parameterName} was not found.", nameof(paramMap));
                    }

                    specificResourceId = specificResourceId.Replace(match.Value, paramMap[parameterName], StringComparison.InvariantCultureIgnoreCase);
                }

                // checking whether the user has a matching permission
                if (!permissions.ResourcePermissions.Any(permission => MatchesPermission(permission, specificResourceId, requiredPermission.Action)))
                {
                    return false;
                }
            }

            return true;
        }

        public static ResourcePermissionDE ToPermission(this Claim claim)
        {
            var resourcePermission = JsonSerializer.Deserialize<ResourcePermissionDE>(claim.Value);
            return resourcePermission;
        }

        public static Claim ToClaim(this ResourcePermissionDE permission)
        {
            //return new Claim(ShopDbClaimTypes.Permission, JsonSerializer.Serialize(permission), "json");
            return new Claim("LMS.Permissions", JsonSerializer.Serialize(permission), "json");
            //JsonSerializer.Deserialize()
        }

        public static IEnumerable<Claim> ToClaims(this IEnumerable<ResourcePermissionDE> permissions)
        {
            return permissions.Select(ToClaim);
        }

        public static ClaimsIdentity ToClaimsIdentity(this IEnumerable<ResourcePermissionDE> permissions)
        {
            return new ClaimsIdentity(permissions.ToClaims());
        }
    }
}
