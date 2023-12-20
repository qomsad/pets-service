namespace PetsService.Domain;

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using Sieve.Services;

[Route("catch_schedule_status")]
public class CatchScheduleStatusController(DatabaseContext context, ISieveProcessor sieve)
  : BaseDictController<CatchScheduleStatus>(context, sieve)
{
  protected override DbSet<CatchScheduleStatus> GetRepository() => this.Context.CatchScheduleStatus;
}
