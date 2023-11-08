using LMS.Core.Entities;
using LMS.Core.Enums;
using LMS.Models;
using LMS.Service;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace LMS.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    // [Authorize]
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    // [AllowAnonymous]
    public class UserController : ControllerBase
    {
        //private readonly SignInManager<User> _signInManager;
        private UserManager<User> userManager;
         private IPasswordHasher<User> passwordHasher;
        //private IPasswordValidator<User> passwordValidator;
        //private IUserValidator<User> userValidator;



        public UserController(SignInManager<User> signInManager, UserManager<User> usrMgr, IPasswordHasher<User> passwordHash, IPasswordValidator<User> passwordVal, IUserValidator<User> userValid)
        {
            //    _signInManager = signInManager;
            userManager = usrMgr;
               passwordHasher = passwordHash;
            //    passwordValidator = passwordVal;
            //    userValidator = userValid;
        }

        //public IActionResult Index()
        //{
        //    return View(userManager.Users);
        //}

        //public ViewResult Create() => View();

        [HttpPost]
        public async Task<ActionResult> Create(User user)
        {
            
            //if (user.DirectSupervisorName != null) {
            //    var u = await userManager.FindByNameAsync(user.DirectSupervisorName);
            User data = new User
            {
                   UserName = user.Email,
                Email = user.Email,
                UserPassword = user.PasswordHash,
                //  PhoneNumber = user.PhoneNumber,
                // DirectSupervisorId = u.DirectSupervisorId
            };
            IdentityResult result = await userManager.CreateAsync(data, user.PasswordHash);
            return Ok(result);

        }
        //    else {
        //        User appUser = new User
        //        {
        //            UserName = user.UserName,
        //            Email = user.Email,
        //            PhoneNumber = user.PhoneNumber,
        //            DirectSupervisorId = user.DirectSupervisorId
        //        };
        //        IdentityResult result = await userManager.CreateAsync(appUser, user.PasswordHash);
        //        return Ok(result);
        //    }


        //   // IdentityResult result = await userManager.CreateAsync(appUser, user.PasswordHash);
        //    //if (result.Succeeded)
        //    //{
        //      // await _signInManager.SignInAsync(user, isPersistent: false);
        //    //}


        //}

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
        //[httppost("{id}")]
        //public async task<actionresult> getuserbyid(user users)
        //{

        //    user user = await usermanager.findbyidasync(users.id);
        //    return ok(user);
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
             user.UserName = users.Email;
            user.Email = users.Email;
           // user.PhoneNumber = users.PhoneNumber;
            //  user.DirectSupervisorId=users.DirectSupervisorId;
              user.PasswordHash = passwordHasher.HashPassword(user, users.PasswordHash);
            IdentityResult result = await userManager.UpdateAsync(user);

            return Ok(result);
        }

        [HttpGet]


        // [EnableCors("AllowOrigin")]

        public ActionResult GetUsers()
        {
            var users = userManager.Users;
            return Ok(users);
        }
    }
}



//    [Route("api/[controller]")]
//    [ApiController]
//    public class UserController : ControllerBase
//    {
//        #region Class Variables
//        private UserService _UserSVC;
//        #endregion
//        #region Constructor
//        public UserController()
//        {
//            _UserSVC = new UserService();
//        }
//        #endregion
//        #region Http Verbs

//        [HttpGet]
//        public ActionResult Get()
//        {
//            UserDE User = new UserDE();
//            List<UserDE> values = _UserSVC.SearchUsers(User);
//            return Ok(values);
//        }
//        [HttpGet("{id}")]
//        public ActionResult GetUserById(int id)
//        {
//            UserDE User = new UserDE { Id = id };
//            var values = _UserSVC.SearchUsers(User);
//            return Ok(values);
//        }
//        [HttpPost("{Search}")]
//        public ActionResult Search(UserDE Search)
//        {
//            //Search.IsActive = true;
//            List<UserDE> values = _UserSVC.SearchUsers(Search);
//            return Ok(values);
//        }
//        [HttpPost("{search}/{user}")]
//        public ActionResult SearchUser(UserDE user)
//        {
//            user.IsActive = true;
//            List<UserDE> values = _UserSVC.SearchUsers(user);
//            if (values.Count > 0)
//                return Ok(true);
//            else
//                return Ok(false);
//        }
//        [HttpPost]
//        public ActionResult Post(UserDE mod)
//        {
//            mod.DBoperation = DBoperations.Insert;
//            bool User = _UserSVC.ManagementUser(mod);
//            return Ok(User);
//        }
//        [HttpPut]
//        public ActionResult Put(UserDE mod)
//        {
//            mod.DBoperation = DBoperations.Update;
//            _UserSVC.ManagementUser(mod);
//            return Ok();
//        }
//        [HttpDelete("{id}")]
//        public void Delete(int id)
//        {
//            UserDE User = new UserDE { Id = id, DBoperation = DBoperations.Delete };
//            _UserSVC.ManagementUser(User);
//        }

//        #endregion
//    }
//}

