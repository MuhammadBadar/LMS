using Restaurant.Core.Enums;
using System.ComponentModel.DataAnnotations;

namespace Restaurant.Core.Entities
{
    public class ResultMsg
    {
        public string? MessageType { get; set; }
        public ResultCodes ResultCode { get; set; }
        public string? Message { get; set; }
    }
}