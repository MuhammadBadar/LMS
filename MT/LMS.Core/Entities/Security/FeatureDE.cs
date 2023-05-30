namespace LMS.Core.Entities.Security
{
    public class FeatureDE : BaseDomain
    {
        public string? Name { get; set; }
        public string? Description { get; set; }

    }

    public class FeaturesList
    {
        public FeaturesList()
        {
            //Features = new List<FeatureDE>();
            //Features.Add(new FeatureDE { Id = 1, Name="Department Management", Description="Add/Modify/Delete & Search Department" });
            //Features.Add(new FeatureDE { Id = 2, Name = "Location Management", Description = "Add/Modify/Delete & Search Location" });

        }
        public List<FeatureDE> Features { get; set; }
    }
}
