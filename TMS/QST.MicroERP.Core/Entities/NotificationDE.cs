using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.Entities
{
    public class NotificationDE
    {
        public string? UserId { get; set; }
        public string? UserName { get; set; }
        public string? DirectSupervisorId { get; set; }
        public string? DirectSupervisorName { get; set; }
        public string? MailSubject { get; set; }
        public string? MailBody { get; set; }
        public string UserMail { get; set; }
        public string DirectSupervisorMail { get; set; }
        public string SenderMail { get; set; }
        public string ReceiverMail { get; set; }
        public NotificationDE()
        {
            this.DirectSupervisorMail = "";
            this.UserMail = "";
            this.SenderMail = "";
            this.ReceiverMail = "";
        }
    }
}
