using LMS.Models;

namespace LMS.Core.Services.Token
{
    public interface IJWTTokenGenerator
    {
        //string GenerateToken(User user, IList<string> roles, IList<Claim> claims);
        string GenerateToken(User user, IList<string> roles);
    }
}
