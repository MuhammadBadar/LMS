using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private RoleManager<IdentityRole> roleManager;
        public RoleController(RoleManager<IdentityRole> roleMgr)
        {
            roleManager = roleMgr;
        }

        [HttpGet]
        public ActionResult GetRoles()
        {
            var roles = roleManager.Roles;
            return Ok(roles);
        }


        [HttpPost("{id}")]
        public async Task<ActionResult> GetRolebyId(IdentityRole roles)
        {
            IdentityRole role = await roleManager.FindByIdAsync(roles.Id);
            return Ok(role);
        }


        [HttpPost]
        public async Task<ActionResult> Create(IdentityRole role)
        {


            IdentityResult result = await roleManager.CreateAsync(new IdentityRole(role.Name));

            return Ok(result);
        }


        [HttpPut]
        public async Task<ActionResult> Update(IdentityRole role)
        {
            IdentityRole Role = await roleManager.FindByIdAsync(role.Id);


            Role.Name = role.Name;

            IdentityResult result = await roleManager.UpdateAsync(Role);

            return Ok(result);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(string id)
        {
            IdentityRole role = await roleManager.FindByIdAsync(id);
            if (role != null)
            {
                IdentityResult result = await roleManager.DeleteAsync(role);
                return Ok();
            }
            else
            {
                return BadRequest("Invalid client request");
            }

        }
    }
}
