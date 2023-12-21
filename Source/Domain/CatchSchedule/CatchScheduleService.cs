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
    var repository = this.Repository(identity);
    var data = this.Sieve.Apply(param, repository);
    var total = this.Sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<CatchSchedule> { Data = data, Total = total };
  }

  public override CatchSchedule? GetOne(long id, IIdentity? identity) =>
    this.Repository(identity).FirstOrDefault(o => o.Id == id);

  public IQueryable<CatchSchedule> Repository(IIdentity? identity)
  {
    var user = this.Permissions.GetUser(identity);
    var permission = this.Permissions.SelectRestrictions(identity, "CATCH_SCHEDULE");
    return this.Context.CatchSchedule.Include(e => e.Status).Where(o => permission == "ALL");
  }
}
