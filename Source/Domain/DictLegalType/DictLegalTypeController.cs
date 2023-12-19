namespace PetsService.Domain;

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using Sieve.Services;

[Route("dic_legal_type")]
public class DictLegalTypeController(DatabaseContext context, ISieveProcessor sieve)
  : BaseDictController<DictLegalType>(context, sieve)
{
  protected override DbSet<DictLegalType> GetRepository() => this.Context.DictLegalType;
}
