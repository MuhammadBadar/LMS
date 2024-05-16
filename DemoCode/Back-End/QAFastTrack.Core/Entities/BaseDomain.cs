using Microsoft.AspNetCore.Http;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public abstract class BaseDomain  
    {
        #region Constructors
        public BaseDomain ( )
        {
            _messageType = String.Empty;
            ResultMessages = new List<ResultMsg> ();
            DBoperation = new DBoperations ();
            CreatedOn = DateTime.Now;
            ModifiedOn = DateTime.Now;
            IsSent = false;
            //  this.IsActive = true;
        }
        #endregion
        #region Class Properties
        public int Id { get; set; }
        public bool IsActive { get; set; }
        public  DBoperations DBoperation { get; set; }
        public int CreatedById { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int ModifiedById { get; set; }
        public DateTime ModifiedOn { get; set; }
        public int ClientId { get; set; }
        public string? ResponseMessage { get; set; }
        public bool? IsSent { get; set; }
        public string? UserFriendlyMessage { get; set; }
        public bool IncludeSubordinatesData { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public long TotalRecords { get; set; }
        public string? Client { get; set; }
        private bool _hasErrors;
        public bool HasErrors
        {
            get
            {
                return ResultMessages.Any (m => m.ResultCode == ResultCodes.Error) ? true : false;
            }
            set
            {
                value = _hasErrors;
            }
        }
        private string _messageType;
        public string MessageType
        {
            get
            {
                return _messageType;
            }
            set
            {
                _messageType = value;
                this.HasErrors = _messageType == MessageTypes.ERROR.ToString () ? true : false;
            }
        }
        public List<ResultMsg> ResultMessages { get; set; }
        #endregion
        #region Methods
        public void AddErrorMessage ( string message )
        {
            AddResultMessage (message, true, ResultCodes.Error);
        }
        private void AddResultMessage ( string message, bool hasErrors, ResultCodes resultCode )
        {
            HasErrors = hasErrors;
            this.MessageType = resultCode.ToString ();
            ResultMessages.Add (new ResultMsg { Message = message, MessageType = resultCode.ToString ().ToLowerInvariant (), ResultCode = resultCode });
            if (hasErrors)
                this.UserFriendlyMessage = message;
        }
        public void AddSuccessMessage ( string message )
        {
            if (message.Contains ("DeActivate"))
                message = message.Replace ("DeActivate", "Delete");
            if (message.Contains ("ee"))
                message = message.Replace ("ee", "e");
            AddResultMessage (message, false, ResultCodes.Success);
        }
        #endregion
    }
}
