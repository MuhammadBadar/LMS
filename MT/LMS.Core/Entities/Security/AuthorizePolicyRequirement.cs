using Microsoft.AspNetCore.Authorization;

namespace LMS.Core.Entities.Security
{
    public class AuthorizePolicyRequirement : IAuthorizationRequirement
    {
        public AuthorizePolicyRequirement(params IAuthorizePolicy[] requiredPolicies)
        {
            RequiredPolicies = requiredPolicies;
        }

        public IAuthorizePolicy[] RequiredPolicies { get; }
    }
}
