using System;
using System.Collections.Generic;
using System.Text;
using QST.MicroERP.Core.Entities;
using QST.MicroERP.Core.Enums;

namespace QST.MicroERP.Core.Entities.Security
{
    public class PermissionDE : BaseDomain
    {

        public string? UserId { get; set; }
        public string? RoleId { get; set; }
        public string? User { get; set; }
        public string? Role { get; set; }
        public int? FeatureId { get; set; }
        public string? Feature { get; set; }
        public int? PermissionValue { get; set; }
        public string? Permission { get; set; }
         public  PermissionDE()
        {
            this.Feature = null;
            this.Permission = null;
            this.UserId = null;
            this.Role = null;
            this.RoleId = null;
            this.User = null;
        }
    }

   
}