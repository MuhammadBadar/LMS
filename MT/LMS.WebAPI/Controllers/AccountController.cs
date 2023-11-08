using LMS.Core.Services.Token;
using LMS.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LMS.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private IConfiguration _config;
        private readonly RoleManager<IdentityRole> _roleManager;
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
            , IConfiguration config)
        {

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
                var user = await _userManager.FindByNameAsync(model.Email);

                if (user != null)
                {
                    var result = await _signInManager.CheckPasswordSignInAsync(user, model.Password, false);
                    var reslt = await _userManager.CheckPasswordAsync(user, model.Password);
                    var results = await _signInManager.PasswordSignInAsync(user.UserName, model.Password, true, true);
                    if (!result.Succeeded)
                    {
                        return Ok(result);
                    }
                    else
                    {
                        if (model.Name != null)
                        {
                            if (user.Name != model.Name)
                            {
                                return BadRequest("Invalid client request");

                            }
                        }
                    }


                    var roles = await _userManager.GetRolesAsync(user);
                    return Ok(new
                    {
                        result = results,
                        id = user.Id,
                        userName = user.UserName,
                        email = user.Email,
                        /*name = user.Name,*/
                        role = roles,
                        token = _jwtToken.GenerateToken(user, roles)

                    });
                }
                else
                {
                    return BadRequest("Invalid client request");
                }
            }
            #endregion
            catch (Exception ex)
            {
                throw ex;

            }
            finally { }

        }
        private string GenerateJSONWebToken(User userInfo)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
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
