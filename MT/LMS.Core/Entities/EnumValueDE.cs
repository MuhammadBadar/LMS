namespace LMS.Core.Entities
{
    public class EnumValueDE
    {
        #region properties
        public int Id { get; set; }
        public int EnumTypeId { get; set; }
        public string? Value { get; set; }
        #endregion
        #region constructor
        public EnumValueDE()
        {
            Value = null;
        }
        #endregion
    }
}
