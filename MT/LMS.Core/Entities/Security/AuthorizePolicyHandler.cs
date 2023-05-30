//using System.IdentityModel.Tokens.Jwt;
using LMS.Core.Entities.Security;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;

//using System.IdentityModel.Tokens;

namespace LMS.Core.Entities.Security
{
    public class AuthorizePolicyHandler : AuthorizationHandler<AuthorizePolicyRequirement>
    {
        private readonly IHttpContextAccessor _httpContextAccessor;


        public AuthorizePolicyHandler(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        protected override async Task HandleRequirementAsync(AuthorizationHandlerContext context, AuthorizePolicyRequirement requirement)
        {
            if (!requirement.RequiredPolicies.Any())
            {
                return;
            }

            //object value;
            ////ControllerContext.HttpContext.Items.TryGetValue("Username", out value);
            //_httpContextAccessor.HttpContext.Items.TryGetValue("Username", out value);

            //var username = value.ToString();

            string token = _httpContextAccessor.HttpContext.Request.Headers["Authorization"];
            if (!string.IsNullOrEmpty(token))
            {
                var tok = token.Replace("Bearer ", "");
                //var jwttoken = new JwtSecurityTokenHandler().ReadJwtToken(tok);
                // var jwttoken = new JwtSecurityToken(tok);


                // var uName = jwttoken.Claims.First(claim => claim.Type == ClaimTypes.Name).Value;
                //context.Items.Add("Username", jti);
            }



            string userName = _httpContextAccessor.HttpContext.User.Identity.Name;

            var claims = context.User.Claims;
            if (!context.User.Identity.IsAuthenticated || string.IsNullOrEmpty(context.User.Identity.Name))
            {

            }

            // get the routing parameters and provide them as parameters required by the authorization policy
            var routeData = _httpContextAccessor.HttpContext!.GetRouteData();
            var paramMap = routeData.Values.ToDictionary(x => x.Key, x => x.Value?.ToString());

            // get the permissions from the claims principal
            //var permissions = context.User.GetPermissions();

            //var user = "Asgher";
            ////var roles = new[] { "Admin", "Supervisor", "Internee", "Student" };
            //var roles = new[] { "SE" };

            //var permissions = await _secSvc.GetPermissionsAsync(user, roles);
            //var appIdentity = permissions.ResourcePermissions.ToClaimsIdentity();

            //// specify the corresponding resource ids which are required
            //var parameters = new Dictionary<string, string>
            //{
            //    { "departmentId", "A" },
            //};

            //var userHasAccess = AuthorizePolicy.DepartmentReadPolicy.IsMetByPermissions(permissions, parameters);
            //Assert.IsTrue(userHasAccess);
            //userHasAccess = AuthorizePolicy.DepartmentWritePolicy.IsMetByPermissions(permissions, parameters);
            //Assert.IsTrue(userHasAccess);

            //user = "Hammad";
            //permissions = await _secSvc.GetPermissionsAsync(user, roles);

            var permissionsList = context.User.Claims.Where(m => m.Type == "LMS.Permissions").ToList();
            ResourcePermissionsList permissions = new ResourcePermissionsList();
            foreach (var per in permissionsList)
            {
                permissions.ResourcePermissions.Add(per.ToPermission());
            }
            //var permissions = new ResourcePermissionsList();
            //check the permissions
            //if (requirement.RequiredPolicies.All(policy => policy.IsMetByPermissions(permissions.ToList(), paramMap)))
            if (requirement.RequiredPolicies.All(policy => policy.IsMetByPermissions(permissions, paramMap)))
            {
                context.Succeed(requirement);
            }

            await Task.CompletedTask;
        }
    }
}
