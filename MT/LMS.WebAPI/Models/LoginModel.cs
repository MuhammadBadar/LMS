using System.ComponentModel.DataAnnotations;

namespace LMS.Models
{
    public class LoginModel
    {
        [Required]
        public string? UserName { get; set; }
        [Required]
        public string? Password { get; set; }
        public string? Name { get; set; }
    }
}
