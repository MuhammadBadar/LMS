using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using QST.MicroERP.Data;
using QST.MicroERP.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
   // [Authorize]
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    // [AllowAnonymous]
    public class UserController : ControllerBase
    {
        private readonly SignInManager<User> _signInManager;
        private UserManager<User> userManager;
        private IPasswordHasher<User> passwordHasher;
        private IPasswordValidator<User> passwordValidator;
        private IUserValidator<User> userValidator;



        public UserController(SignInManager<User> signInManager,UserManager<User> usrMgr, IPasswordHasher<User> passwordHash, IPasswordValidator<User> passwordVal, IUserValidator<User> userValid)
        {
            _signInManager = signInManager;
            userManager = usrMgr;
            passwordHasher = passwordHash;
            passwordValidator = passwordVal;
            userValidator = userValid;
        }

        //public IActionResult Index()
        //{
        //    return View(userManager.Users);
        //}

        //public ViewResult Create() => View();

        [HttpPost]
        public async Task<ActionResult> Create(User user)
        {
            if (user.DirectSupervisorName != null) {
                var u = await userManager.FindByNameAsync(user.DirectSupervisorName);
                User data = new User
                {
                    UserName = user.UserName,
                    Email = user.Email,
                    PhoneNumber = user.PhoneNumber,
                    DirectSupervisorId = u.DirectSupervisorId
                };
                IdentityResult result = await userManager.CreateAsync(data, user.PasswordHash);
                return Ok(result);

            }
            else {
                User appUser = new User
                {
                    UserName = user.UserName,
                    Email = user.Email,
                    PhoneNumber = user.PhoneNumber,
                    DirectSupervisorId = user.DirectSupervisorId
                };
                IdentityResult result = await userManager.CreateAsync(appUser, user.PasswordHash);
                return Ok(result);
            }
               

           // IdentityResult result = await userManager.CreateAsync(appUser, user.PasswordHash);
            //if (result.Succeeded)
            //{
              // await _signInManager.SignInAsync(user, isPersistent: false);
            //}
         

        }

        [HttpDelete]
        public async Task<ActionResult> Delete(string id)
        {
            User user = await userManager.FindByIdAsync(id);
            if (user != null)
            {
                IdentityResult result = await userManager.DeleteAsync(user);
            }
            return Ok();
        }
        //[HttpPost("{id}")]
        //public async Task<ActionResult> GetUserbyId(User users)
        //{
         
        //    User user = await userManager.FindByIdAsync(users.Id);
        //    return Ok(user);
        //}
        [HttpPost("{name}")]
        public async Task<ActionResult> GetUserbyName(User users)
        {

            User user = await userManager.FindByNameAsync(users.UserName);
            return Ok(user);
        }

        [HttpPut]
        public async Task<ActionResult> Update(User users)
        {
            User user = await userManager.FindByIdAsync(users.Id);
                user.UserName = users.UserName;
                user.Email = users.Email;
                user.PhoneNumber=users.PhoneNumber;
                user.DirectSupervisorId=users.DirectSupervisorId;
                user.PasswordHash = passwordHasher.HashPassword(user, users.PasswordHash);
                IdentityResult result = await userManager.UpdateAsync(user);

            return Ok(result);
        }

        [HttpGet]
       
      
       // [EnableCors("AllowOrigin")]
       
        public  ActionResult GetUsers()
        {
            var users =  userManager.Users;
        return Ok(users);
        }
    }
}