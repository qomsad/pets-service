namespace PetsService.Domain;

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using Sieve.Services;

[Route("dic_municipality")]
public class DictMunicipalityController(DatabaseContext context, ISieveProcessor sieve)
  : BaseDictController<DictMunicipality>(context, sieve)
{
  protected override DbSet<DictMunicipality> GetRepository() => this.Context.DictMunicipality;
}
