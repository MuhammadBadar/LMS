using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.Entities
{
    public class LogEventDE:BaseDomain
    {
        public string? Action { get; set; }
        public string? Message { get; set; }
        public string? UserId { get; set; }
        public string? UserName { get; set; }
    }
}
