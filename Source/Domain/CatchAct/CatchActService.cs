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
    var repository = this.Repository(identity);
    var data = this.Sieve.Apply(param, repository);
    var total = this.Sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<CatchAct> { Data = data, Total = total };
  }

  public override CatchAct? GetOne(long id, IIdentity? identity) =>
    this.Repository(identity).FirstOrDefault(o => o.Id == id);

  private IQueryable<CatchAct> Repository(IIdentity? identity)
  {
    var user = this.Permissions.GetUser(identity);
    var permission = this.Permissions.SelectRestrictions(identity, "CATCH_ACT");
    return this.Context
      .CatchAct
      .Include(e => e.Municipality)
      .Include(e => e.Organization)
      .Include(e => e.CatchActCards)
      .Where(
        o =>
          (permission == "ALL")
          || (permission == "MUN" && (o.MunicipalityId == user!.MunicipalityId))
          || (permission == "ORG" && (o.OrganizationId == user!.OrganizationId))
      );
  }
}
