using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;

namespace QST.MicroERP.Models
{

    public class User : IdentityUser
    {
        [PersonalData]
        [Column(TypeName = "nvarchar(200)")]
        public string? FirstName { get; set; }
        [PersonalData]
        [Column(TypeName = "nvarchar(200)")]
        public string? DirectSupervisorName { get; set; }
        [PersonalData]
        [Column(TypeName = "nvarchar(255)")]
        public string? DirectSupervisorId { get; set; }
        [PersonalData]
        [Column(TypeName = "nvarchar(200)")]
        public string? LastName { get; set; }
    }


}
