namespace PetsService.Domain;

using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using Sieve.Models;
using Sieve.Services;

public class OrganizationService(DatabaseContext c, ISieveProcessor s)
  : BaseService<Organization>(c, s)
{
  public override Organization? GetOne(long id) =>
    this.Context
      .Organization
      .Include(o => o.LegalType)
      .Include(o => o.Municipality)
      .Include(o => o.OrganizationType)
      .FirstOrDefault(o => o.Id == id);

  public override Pagination<Organization> GetList(SieveModel param)
  {
    var repository = this.Context
      .Organization
      .Include(o => o.LegalType)
      .Include(o => o.Municipality)
      .Include(o => o.OrganizationType);
    var data = this.Sieve.Apply(param, repository);
    var total = this.Sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<Organization> { Data = data, Total = total };
  }
}
