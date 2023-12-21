namespace PetsService.Domain;

using System.Security.Principal;
using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using PetsService.Security;
using Sieve.Models;
using Sieve.Services;

public class OrganizationService(DatabaseContext c, ISieveProcessor s, PermissionService p)
  : BaseService<Organization>(c, s, p)
{
  public override Organization? GetOne(long id, IIdentity? identity) =>
    this.Repository(identity).FirstOrDefault(o => o.Id == id);

  public override Pagination<Organization> GetList(SieveModel param, IIdentity? identity)
  {
    var repository = this.Repository(identity);
    var data = this.Sieve.Apply(param, repository);
    var total = this.Sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<Organization> { Data = data, Total = total };
  }

  private IQueryable<Organization> Repository(IIdentity? identity)
  {
    var user = this.Permissions.GetUser(identity);
    var permission = this.Permissions.SelectRestrictions(identity, "ORGANIZATION");
    return this.Context
      .Organization
      .Include(o => o.LegalType)
      .Include(o => o.Municipality)
      .Include(o => o.OrganizationType)
      .Where(
        o =>
          (permission == "ALL")
          || (permission == "MUN" && (o.MunicipalityId == user!.MunicipalityId))
          || (permission == "ORG" && (o.Id == user!.OrganizationId))
      );
  }
}
