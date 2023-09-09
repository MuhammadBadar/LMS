using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using QST.MicroERP.Core.Services.Token;
using QST.MicroERP.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QST.MicroERP.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private IConfiguration _config;
        private  readonly RoleManager<IdentityRole> _roleManager;   
        private readonly IJWTTokenGenerator _jwtToken;
        private readonly SignInManager<User> _signInManager;
        private UserManager<User> _userManager;
        #pragma warning disable CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
        public AccountController(
        #pragma warning restore CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
            SignInManager<User> signInManager,
            UserManager<User> usrMgr,
            IJWTTokenGenerator jwtToken,
            RoleManager<IdentityRole> roleMgr
            , IConfiguration config) {

            _jwtToken = jwtToken;
            _roleManager = roleMgr;
            _signInManager = signInManager;
            _userManager = usrMgr;
            _config = config;
        }


        [HttpPost]
        public async Task<ActionResult> Login(LoginModel model)

        {
            #region
            try
            {
        
                var user = await _userManager.FindByNameAsync(model.UserName);
                if (user == null)
                {
                    return BadRequest("Invalid client request");
                }
                var result = await _signInManager.CheckPasswordSignInAsync(user, model.Password, false);
                if (!result.Succeeded)
                {
                    return Ok(result);
                }



                await _signInManager.SignInAsync(user, isPersistent: false);
                var reslt = await _userManager.CheckPasswordAsync(user, model.Password);
                var results = await _signInManager.PasswordSignInAsync(model.UserName, model.Password,true, true);
                //  await _signInManager.SignInAsync(user,false, CookieAuthenticationDefaults.AuthenticationScheme);
                // return Ok();
                var roles = await _userManager.GetRolesAsync(user);
                return Ok(new
                {
                    result = results,
                    id= user.Id,
                    userName = user.UserName,
                    email = user.Email,
                    role = roles,
                    token = _jwtToken.GenerateToken(user, roles)

                });
                // return Ok(results);
                //    var tokenString = GenerateJSONWebToken(user);
                //return Ok(new { token = tokenString });
            }
            #endregion
            #region
            //try
            //{
            //    ActionResult response = Unauthorized();




            //    var user = await _userManager.FindByNameAsync(model.UserName);
            //    if (user == null)
            //    {
            //        return BadRequest("Invalid client request");
            //    }
            //    var result = await _signInManager.CheckPasswordSignInAsync(user, model.Password, false);

            //    if (!result.Succeeded)
            //    {
            //        return Ok(result);
            //    }
            //    if (result.Succeeded)
            //    {
            //        var claims = new List<Claim>();

            //        claims.Add(new Claim(JwtRegisteredClaimNames.GivenName, user.UserName));
            //        claims.Add(new Claim(JwtRegisteredClaimNames.Email, user.Email));
            //        var roles = await _userManager.GetRolesAsync(user);
            //        foreach (var role in roles)
            //        {
            //            claims.Add(new Claim(ClaimTypes.Role, role));
            //        }
            //        var secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("superSecretKey@345"));
            //        var signinCredentials = new SigningCredentials(secretKey, SecurityAlgorithms.HmacSha256);
            //        var tokeOptions = new JwtSecurityToken(
            //            issuer: "https://localhost:44306",
            //            audience: "https://localhost:44306",
            //            claims,
            //            expires: DateTime.Now.AddMinutes(5),
            //            signingCredentials: signinCredentials
            //        );
            //        var tokenString = new JwtSecurityTokenHandler().WriteToken(tokeOptions);
            //        return Ok(new { Token = tokenString });
            //    }
            //    else
            //    {
            //        return Unauthorized();
            //    }
            //}
            #endregion
            catch (Exception ex) {
                throw ex;

            }
            finally { }
          
        }
        private string GenerateJSONWebToken(User userInfo)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[] {
 new Claim(JwtRegisteredClaimNames.Sub, userInfo.UserName),
 new Claim(JwtRegisteredClaimNames.Email, userInfo.Email),

 };

            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
            _config["Jwt:Issuer"],
            claims,
            expires: DateTime.Now.AddMinutes(120),
            signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }


    }
}
