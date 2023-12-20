namespace PetsService.Domain;

using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;

public class AuthUserService(DatabaseContext context)
{
  public AuthUser? GetByLogin(string login) =>
    context
      .AuthUser
      .Include(e => e.Role)
      .ThenInclude(e => e.Privileges)
      .FirstOrDefault(e => e.Login == login);
}
