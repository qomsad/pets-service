namespace PetsService.Domain;

using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using Sieve.Models;
using Sieve.Services;

public class ContractService(DatabaseContext c, ISieveProcessor s) : BaseService<Contract>(c, s)
{
  public override Pagination<Contract> GetList(SieveModel param)
  {
    var repository = this.Context
      .Contract
      .Include(e => e.Contractor)
      .Include(e => e.Customer)
      .Include(e => e.Contractor.LegalType)
      .Include(e => e.Contractor.OrganizationType)
      .Include(e => e.Customer.LegalType)
      .Include(e => e.Customer.OrganizationType)
      .Include(e => e.ContractCosts)
      .ThenInclude(e => e.Municipality);
    var data = this.Sieve.Apply(param, repository);
    var total = this.Sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<Contract> { Data = data, Total = total };
  }

  public override Contract? GetOne(long id) =>
    this.Context
      .Contract
      .Include(e => e.Contractor)
      .Include(e => e.Customer)
      .Include(e => e.Contractor.LegalType)
      .Include(e => e.Contractor.OrganizationType)
      .Include(e => e.Customer.LegalType)
      .Include(e => e.Customer.OrganizationType)
      .Include(e => e.ContractCosts)
      .ThenInclude(e => e.Municipality)
      .FirstOrDefault(e => e.Id == id);
}
