using LMS.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMS.Core.Entities
{
    public class useraccountDE : BaseDomain
    {
        public string? UserName { get; set; }
       
        public string? Cell { get; set; }
        public string?  Email { get; set; }
        public string? Password { get; set; }
        public string? RetypePassword { get; set; }
      


    }
}
