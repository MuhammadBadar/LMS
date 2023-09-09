using Microsoft.AspNetCore.Identity;
using QST.MicroERP.Models;
using System.Security.Claims;

namespace QST.MicroERP.Core.Services.Token
{
	public interface IJWTTokenGenerator
	{
		//string GenerateToken(User user, IList<string> roles, IList<Claim> claims);
        string GenerateToken(User user, IList<string> roles);
    }
}
