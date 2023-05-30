namespace LMS.Core.Entities.Security
{
    public interface IAuthorizePolicy
    {
        RequiredPermission[] Permissions { get; }

        string Key { get; }
    }
}
