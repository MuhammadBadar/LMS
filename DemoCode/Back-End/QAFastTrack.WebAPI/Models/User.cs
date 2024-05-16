using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Restaurant.Models
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
        [Column(TypeName = "nvarchar(200)")]
        public string? UserPassword { get; set; }
        [PersonalData]
        [Column(TypeName = "nvarchar(200)")]
        public string? Name { get; set; }
        [PersonalData]
        [Column(TypeName = "int")]
        public int? EmployeeId { get; set; }
        [PersonalData]
        [Column(TypeName = "nvarchar(255)")]
        public string? FatherName { get; set; }
        [PersonalData]
        [Column(TypeName = "nvarchar(255)")]
        public string? CNIC { get; set; }
        [PersonalData]
        [Column(TypeName = "nvarchar(255)")]
        public string? Address { get; set; }
        [PersonalData]
        [Column(TypeName = "nvarchar(255)")]
        public string? Designation { get; set; }
        [PersonalData]
        [Column(TypeName = "nvarchar(255)")]
        public string? MSCardNo { get; set; }
        [PersonalData]
        [Column(TypeName = "int")]
        public int? DiscountLimit { get; set; }
        [PersonalData]
        [Column(TypeName = "int")]
        public int? BranchId { get; set; }
        [PersonalData]
        [Column(TypeName = "bit(1)")]
        public Boolean? IsActive { get; set; }
        [PersonalData]
        [Column (TypeName = "int")]
        public int? ClientId { get; set; }
        [PersonalData]
        [Column (TypeName = "int")]
        public int? ModuleId { get; set; }
        [PersonalData]
        [Column (TypeName = "string")]
        public string? ReportToId { get; set; }
        [PersonalData]
        [Column (TypeName = "int")]
        public int? RoleId { get; set; }
        public override string? UserName { get; set; }
    }


}
