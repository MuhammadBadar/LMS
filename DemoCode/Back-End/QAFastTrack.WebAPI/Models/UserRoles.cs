using Microsoft.AspNetCore.Identity;

namespace Restaurant.Models
{
    public class UserRoles
    {
        public string? userId { get; set; }
        public string? uName { get; set; }
        public string? name { get; set; }
        public IList<string>? role { get; set; }
        //public AssignRoles()
        //{
        //    Roles = new List<IdentityRole>();
        //}
    }
}
