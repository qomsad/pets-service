namespace PetsService.Domain;

using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using Sieve.Models;
using Sieve.Services;

public class AuthUserService(DatabaseContext context, ISieveProcessor sieve)
{
  public AuthUser? GetByLogin(string login) =>
    context
      .AuthUser
      .Include(e => e.Role)
      .ThenInclude(e => e.Privileges)
      .FirstOrDefault(e => e.Login == login);

  public Pagination<AuthUser> GetList(SieveModel param)
  {
    var repository = context.AuthUser;
    var data = sieve.Apply(param, repository);
    var total = sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<AuthUser> { Data = data, Total = total };
  }
}
