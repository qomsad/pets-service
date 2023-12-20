namespace PetsService.Domain;

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using Sieve.Services;

[Route("report_municipality_status")]
public class ReportMunicipalityStatusController(DatabaseContext context, ISieveProcessor sieve)
  : BaseDictController<ReportMunicipalityStatus>(context, sieve)
{
  protected override DbSet<ReportMunicipalityStatus> GetRepository() =>
    this.Context.ReportMunicipalityStatus;
}
