namespace PetsService.Domain;

using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using Sieve.Models;
using Sieve.Services;

public class CatchScheduleService(DatabaseContext c, ISieveProcessor s)
  : BaseService<CatchSchedule>(c, s)
{
  public override Pagination<CatchSchedule> GetList(SieveModel param)
  {
    var repository = this.Context.CatchSchedule.Include(e => e.Status);
    var data = this.Sieve.Apply(param, repository);
    var total = this.Sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<CatchSchedule> { Data = data, Total = total };
  }

  public override CatchSchedule? GetOne(long id) =>
    this.Context.CatchSchedule.Include(e => e.Status).FirstOrDefault(o => o.Id == id);
}
