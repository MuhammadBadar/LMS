namespace LMS.Core.Entities
{
    public class SettingsTypeDE : BaseDomain
    {
        #region Properties
        public int? ParentId { get; set; }
        public string? KeyCode { get; set; }
        public bool IsSystemDefined { get; set; }
        public bool IstAccountLevel { get; set; }
        public string? Description { get; set; }
        public string? Name { get; set; }
        public string? ParentName { get; set; }
        public bool UploadStatus { get; set; }
        #endregion
        #region Constructor
        public SettingsTypeDE()
        {
            KeyCode = null;
            Description = null;
            Name = null;
        }
        #endregion
    }
}