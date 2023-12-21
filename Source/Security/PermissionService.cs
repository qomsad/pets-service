namespace PetsService.Security;

using System.Security.Principal;
using PetsService.Domain;

public class PermissionService(AuthUserService service)
{
  public bool CanCreate(IIdentity? identity, string registry) =>
    this.Check(identity, registry, "INSERT", "ALL");

  public bool CanUpdate(IIdentity? identity, string registry) =>
    this.Check(identity, registry, "UPDATE", "ALL");

  public bool CanDelete(IIdentity? identity, string registry) =>
    this.Check(identity, registry, "DELETE", "ALL");

  public string SelectRestrictions(IIdentity? identity, string registry)
  {
    var user = this.GetUser(identity);
    var restrictions = user?.Role
      .Privileges
      .Where(p => p.Entity == registry && p.Possibility == "SELECT")
      .Select(p => p.Restriction);

    if (restrictions?.Contains("ALL") == true)
    {
      return "ALL";
    }
    if (restrictions?.Contains("ORG") == true)
    {
      return "ORG";
    }
    if (restrictions?.Contains("MUN") == true)
    {
      return "MUN";
    }
    return "NONE";
  }

  public bool Check(IIdentity? identity, string registry, string action, string restriction)
  {
    var user = this.GetUser(identity);
    return user?.Role
        .Privileges
        .Any(p => p.Entity == registry && p.Possibility == action && p.Restriction == restriction)
      == true;
  }

  public AuthUser? GetUser(IIdentity? identity)
  {
    var login = identity?.Name;
    if (login is null)
    {
      return null;
    }
    return service.GetByLogin(login);
  }
}
