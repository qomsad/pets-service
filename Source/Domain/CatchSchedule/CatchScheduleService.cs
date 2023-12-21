namespace PetsService.Domain;

using System.Security.Principal;
using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using PetsService.Security;
using Sieve.Models;
using Sieve.Services;

public class CatchScheduleService(DatabaseContext c, ISieveProcessor s, PermissionService p)
  : BaseService<CatchSchedule>(c, s, p)
{
  public override Pagination<CatchSchedule> GetList(SieveModel param, IIdentity? identity)
  {
    var repository = this.Context.CatchSchedule.Include(e => e.Status);
    var data = this.Sieve.Apply(param, repository);
    var total = this.Sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<CatchSchedule> { Data = data, Total = total };
  }

  public override CatchSchedule? GetOne(long id, IIdentity? identity) =>
    this.Context.CatchSchedule.Include(e => e.Status).FirstOrDefault(o => o.Id == id);
}
