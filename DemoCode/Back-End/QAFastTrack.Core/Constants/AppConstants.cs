using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Constants
{
    public class AppConstants
    {
        public const string TIME_FORMAT_HHMMSS = @"hh\:mm\:ss";
        public const string DATE_FORMAT_YYYYMMDD = "{0:yyyy/MM/dd}";

        public const string EXISTS = "{0} Already Exists";

        public const string CRUD_ERROR = "Unable to perform CRUD operation on {0}";
        public const string SEARCH_ERROR = "Unable to search record";

        public const string CRUD_DB_OPERATION = "{0} {1}ed Successfully";
        public const string CRUD_DB__OPERATION = "{0} {1}d Successfully";

        public const string CRUD_ADD = "{0} Added Successfully";
        public const string CRUD_ADD_STARTED = "{0} Add Started";
        public const string CRUD_PERFORMED_SUCCESSFULLY = "{0} performed successfully";

        public const string CRUD_UPDATE = "{0} Updated Successfully";
        public const string CRUD_UPDATE_STARTED = "{0} Update Started";

        public const int GRID_MIN_PAGE_SIZE = 1;
        public const int GRID_MAX_PAGE_SIZE = 99999999;

        public const int DEFAULT_OPENING_BALANCE_DATE = 1;
        public const int DEFAULT_OPENING_BALANCE_MONTH = 7;
    }
}
