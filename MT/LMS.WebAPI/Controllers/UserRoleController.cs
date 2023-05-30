using LMS.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class UserRoleController : ControllerBase
    {
        public IdentityRole? role { get; set; }
        private UserManager<User> userManager;
        private RoleManager<IdentityRole> roleManager;
        public UserRoleController(UserManager<User> usrMgr, RoleManager<IdentityRole> roleMgr)
        {
            userManager = usrMgr;
            roleManager = roleMgr;
        }

        [HttpPost]
        public async Task<ActionResult> AddUsersInRoles(UserRoles uroles)
        {


            var user = await userManager.FindByIdAsync(uroles.userId);
            for (int i = 0; i < uroles.role.Count; i++)
            {
                bool check = await userManager.IsInRoleAsync(user, uroles.role[i]);
                if (check == false)
                {
                    IdentityResult result = await userManager.AddToRoleAsync(user, uroles.role[i]);

                }
            }
            return Ok();
        }
        [HttpPost("{Delete}")]
        public async Task<ActionResult> RemoveUsersFromRole(UserRoles uroles)
        {
            User user = new User();
            if (uroles.userId != null) { user = await userManager.FindByIdAsync(uroles.userId); }
            else { user = await userManager.FindByNameAsync(uroles.uName); }
            for (int i = 0; i < uroles.role.Count; i++)
            {
                bool check = await userManager.IsInRoleAsync(user, uroles.role[i]);
                if (check == true)
                {
                    IdentityResult result = await userManager.RemoveFromRoleAsync(user, uroles.role[i]);

                }
            }
            //  IdentityResult result = await userManager.RemoveFromRolesAsync(user,uroles.role);


            return Ok();
        }
        [HttpGet]
        public async Task<ActionResult> GetUsersroles()
        {

            List<UserRoles> uroles = new List<UserRoles>();
            UserRoles uRoles = new UserRoles();
            try
            {
                var users = userManager.Users;
                foreach (var us in users.ToList())
                {
                    // var user = await userManager.FindByIdAsync(us.Id);
                    var roles = await userManager.GetRolesAsync(us);
                    uRoles.role = roles;
                    UserRoles uRole = new UserRoles { userId = us.Id, role = uRoles.role, uName = us.UserName, name = us.Name };
                    uroles.Add(uRole);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            finally { };




            return Ok(uroles);

        }
        [HttpGet("{id}")]
        public async Task<ActionResult> GetUsersrolesbyId(string id)
        {

            List<UserRoles> uroles = new List<UserRoles>();
            UserRoles uRoles = new UserRoles();

            var user = await userManager.FindByIdAsync(id);
            var roles = await userManager.GetRolesAsync(user);
            uRoles.role = roles;
            UserRoles uRole = new UserRoles { userId = user.Id, role = uRoles.role, uName = user.UserName };
            return Ok(uRole);

        }



    }
}