using LMS.Core.Enums;

namespace LMS.Core.Entities.Security
{
    public class AuthorizePolicy : IAuthorizePolicy //, Enumeration<string>
    {
        public const string DepartmentRead = "DEPARTMENT_READ";
        public const string DepartmentWrite = "DEPARTMENT_WRITE";

        public static readonly AuthorizePolicy DepartmentReadPolicy = new AuthorizePolicy(
            DepartmentRead,
            //new[] { new RequiredPermission("/Department/{departmentTypeId}", PermissionActions.Read) });
            new[] { new RequiredPermission("/Department/", PermissionActions.Read) });

        public static readonly AuthorizePolicy DepartmentWritePolicy = new AuthorizePolicy(
            DepartmentWrite,
            new[] { new RequiredPermission("/Department/{departmentTypeId}", PermissionActions.Write) });

        private AuthorizePolicy(string key, RequiredPermission[] permissions) //:  base(key)
        {
            Permissions = permissions;
        }

        public RequiredPermission[] Permissions { get; }

        //public string Key => throw new NotImplementedException();
        public string Key => "DepartmentPolicy";
    }

}
//public abstract class Enumeration : IComparable
//{
//    public string Name { get; private set; }

//    public int Id { get; private set; }

//    protected Enumeration(int id, string name) => (Id, Name) = (id, name);

//    public override string ToString() => Name;

//    public static IEnumerable<T> GetAll<T>() where T : Enumeration =>
//        typeof(T).GetFields(BindingFlags.Public |
//                            BindingFlags.Static |
//                            BindingFlags.DeclaredOnly)
//                 .Select(f => f.GetValue(null))
//                 .Cast<T>();

//    public override bool Equals(object obj)
//    {
//        if (obj is not Enumeration otherValue)
//        {
//            return false;
//        }

//        var typeMatches = GetType().Equals(obj.GetType());
//        var valueMatches = Id.Equals(otherValue.Id);

//        return typeMatches && valueMatches;
//    }

//    public int CompareTo(object other) => Id.CompareTo(((Enumeration)other).Id);

//    // Other utility methods ...
//}
//}
