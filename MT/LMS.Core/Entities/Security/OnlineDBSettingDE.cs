namespace LMS.Core.Entities.Security
{
    public class OnlineDBSettingDE : BaseDomain
    {
        #region Properties
        public string? DataBaseName { get; set; }
        public string? ServerName { get; set; }
        public string? UserName { get; set; }
        public string? Password { get; set; }
        #endregion
        #region Constructor
        public OnlineDBSettingDE()
        {
            DataBaseName = null;
            ServerName = null;
            UserName = null;
            Password = null;
        }
        #endregion
    }
}
