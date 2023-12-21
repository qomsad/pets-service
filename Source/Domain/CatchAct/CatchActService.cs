namespace PetsService.Domain;

using System.Security.Principal;
using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using PetsService.Security;
using Sieve.Models;
using Sieve.Services;

public class CatchActService(DatabaseContext c, ISieveProcessor s, PermissionService p)
  : BaseService<CatchAct>(c, s, p)
{
  public override Pagination<CatchAct> GetList(SieveModel param, IIdentity? identity)
  {
    var repository = this.Context
      .CatchAct
      .Include(e => e.Municipality)
      .Include(e => e.Organization)
      .Include(e => e.CatchActCards);
    var data = this.Sieve.Apply(param, repository);
    var total = this.Sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<CatchAct> { Data = data, Total = total };
  }

  public override CatchAct? GetOne(long id, IIdentity? identity) =>
    this.Context
      .CatchAct
      .Include(e => e.Municipality)
      .Include(e => e.Organization)
      .Include(e => e.CatchActCards)
      .FirstOrDefault(o => o.Id == id);
}
