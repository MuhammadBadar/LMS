using System.ComponentModel.DataAnnotations;

namespace LMS.Models
{
    public class LoginModel
    {
        public string? Email { get; set; }
        public string? UserName { get; set; }
        public string? Password { get; set; }
        public string? Name { get; set; }
    }
}
