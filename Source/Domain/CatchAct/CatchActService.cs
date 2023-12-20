namespace PetsService.Domain;

using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using Sieve.Models;
using Sieve.Services;

public class CatchActService(DatabaseContext c, ISieveProcessor s) : BaseService<CatchAct>(c, s)
{
  public override Pagination<CatchAct> GetList(SieveModel param)
  {
    var repository = this.Context
      .CatchAct
      .Include(e => e.Municipality)
      .Include(e => e.Organization)
      .Include(e => e.CatchActCards);
    var data = this.Sieve.Apply(param, repository);
    var total = this.Sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<CatchAct> { Data = data, Total = total };
  }

  public override CatchAct? GetOne(long id) =>
    this.Context
      .CatchAct
      .Include(e => e.Municipality)
      .Include(e => e.Organization)
      .Include(e => e.CatchActCards)
      .FirstOrDefault(o => o.Id == id);
}
