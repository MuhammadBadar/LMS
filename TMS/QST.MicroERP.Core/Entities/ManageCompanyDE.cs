using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QST.MicroERP.Core.Entities
{
    public class ManageCompanyDE:BaseDomain
    {
        public int CityId { get; set; }
        public int ProvinceId { get; set; }
        public int CountryId { get; set; }
        public string? Name { get; set; }
        public string? ContactPerson { get; set; }
        public string? Cell { get; set; }
        public string? Telephone { get; set; }
        public string? WhatsApp { get; set; }
        public string? AddressLine1 { get; set; }
        public string? AddressLine2 { get; set; }
        public ManageCompanyDE()
        {
            this.Cell = null;
            this.Telephone = null;  
            this.AddressLine1 = null;  
            this.AddressLine2 = null;   
            this.WhatsApp = null;   
            this.Name = null;
            this.ContactPerson = null;  
        }
    }
}
