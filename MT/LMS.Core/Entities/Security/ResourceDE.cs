namespace LMS.Core.Entities.Security
{
    public class ResourceDE : BaseDomain
    {
        public string? ResourceValue { get; set; }
        //public int ResourceTypeId { get; set; }
        public int FeatureId { get; set; }
        //public string Name { get; set; }
        public int ControllerId { get; set; }
        public string? Controller { get; set; }
        public int ActionId { get; set; }
        public string? Action { get; set; }
        public string? Value { get; set; }
        //public string Value 
        //{ 
        //    get
        //    {
        //        //return Controller + "/" + "*";
        //        return Controller + "/" + Action;
        //    }

        //} // It should be Controller/Action
    }

    public class ResourcesList
    {
        public ResourcesList()
        {
            Resources = new List<ResourceDE>();

            //Resources.Add(new ResourceDE { Id = 1, FeatureId = 1, Name = "CreateDepartment", Value = "A" });
            //Resources.Add(new ResourceDE { Id = 2, FeatureId = 1, Name = "UpdateDepartment", Value = "B" });
            //Resources.Add(new ResourceDE { Id = 3, FeatureId = 1, Name = "GetAllDepartments", Value = "C" });

            //Resources.Add(new ResourceDE { Id = 4, FeatureId = 2, Name = "CreateLocation", Value = "D" });
            //Resources.Add(new ResourceDE { Id = 5, FeatureId = 2, Name = "UpdateLocation", Value = "E" });
            //Resources.Add(new ResourceDE { Id = 6, FeatureId = 2, Name = "GetAllLocations", Value = "F" });


            Resources.Add(new ResourceDE { Id = 1, FeatureId = 1, Value = "A" });
            Resources.Add(new ResourceDE { Id = 2, FeatureId = 1, Value = "B" });
            Resources.Add(new ResourceDE { Id = 3, FeatureId = 1, Value = "C" });

            Resources.Add(new ResourceDE { Id = 4, FeatureId = 2, Value = "D" });
            Resources.Add(new ResourceDE { Id = 5, FeatureId = 2, Value = "E" });
            Resources.Add(new ResourceDE { Id = 6, FeatureId = 2, Value = "F" });

        }

        public List<ResourceDE> Resources { get; set; }
    }
}
