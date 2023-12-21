namespace PetsService.Domain;

using System.Security.Principal;
using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using PetsService.Security;
using Sieve.Models;
using Sieve.Services;

public class ContractService(DatabaseContext c, ISieveProcessor s, PermissionService p)
  : BaseService<Contract>(c, s, p)
{
  public override Pagination<Contract> GetList(SieveModel param, IIdentity? identity)
  {
    var repository = this.Repository(identity);
    var data = this.Sieve.Apply(param, repository);
    var total = this.Sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<Contract> { Data = data, Total = total };
  }

  public override Contract? GetOne(long id, IIdentity? identity) =>
    this.Repository(identity).FirstOrDefault(e => e.Id == id);

  private IQueryable<Contract> Repository(IIdentity? identity)
  {
    var user = this.Permissions.GetUser(identity);
    var permission = this.Permissions.SelectRestrictions(identity, "CONTRACT");
    return this.Context
      .Contract
      .Include(e => e.Contractor)
      .Include(e => e.Customer)
      .Include(e => e.Contractor.LegalType)
      .Include(e => e.Contractor.OrganizationType)
      .Include(e => e.Customer.LegalType)
      .Include(e => e.Customer.OrganizationType)
      .Include(e => e.ContractCosts)
      .ThenInclude(e => e.Municipality)
      .Where(
        o =>
          (permission == "ALL")
          || (
            permission == "MUN"
            && o.ContractCosts.Any(p => p.MunicipalityId == user!.MunicipalityId)
          )
          || (permission == "ORG" && (o.ContractorId == user!.OrganizationId))
      );
  }
}
