namespace PetsService.Security;

using Microsoft.EntityFrameworkCore;
using PetsService.Domain;
using PetsService.Infrastructure;

public class AuthenticationService(DatabaseContext context)
{
  public AuthUser? GetUser(string login) =>
    context
      .AuthUser
      .Include(u => u.Role)
      .ThenInclude(r => r.Privileges)
      .Include(u => u.Organization)
      .Include(u => u.Municipality)
      .FirstOrDefault(u => u.Login == login);
}
