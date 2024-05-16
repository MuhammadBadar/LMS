using Microsoft.AspNetCore.Identity;
using Restaurant.Models;
using System.Security.Claims;

namespace Restaurant.Core.Services.Token
{
	public interface IJWTTokenGenerator
	{
		//string GenerateToken(User user, IList<string> roles, IList<Claim> claims);
        string GenerateToken(User user, IList<string> roles);
    }
}
