namespace PetsService.Domain;

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using Sieve.Services;

[Route("dic_organization_type"), ApiController]
public class DictOrganizationTypeController(DatabaseContext context, ISieveProcessor sieve)
  : BaseDictController<DictOrganizationType>(context, sieve)
{
  protected override DbSet<DictOrganizationType> GetRepository() =>
    this.Context.DictOrganizationType;
}
