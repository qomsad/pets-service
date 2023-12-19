namespace PetsService.Infrastructure;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Sieve.Models;
using Sieve.Services;

[ApiController]
public abstract class BaseDictController<T>(DatabaseContext context, ISieveProcessor sieve)
  : ControllerBase
  where T : class
{
  protected DatabaseContext Context { get; } = context;

  [HttpGet]
  public IActionResult GetAll([FromQuery] SieveModel param)
  {
    var data = sieve.Apply(param, this.GetRepository());
    var total = sieve
      .Apply(new SieveModel { Filters = param.Filters }, this.GetRepository())
      .Count();
    return this.Ok(new Pagination<T> { Data = data, Total = total });
  }

  [HttpGet("{id}")]
  public IActionResult GetOne(long id)
  {
    var entity = this.GetRepository().Find(id);

    if (entity == null)
    {
      return this.NotFound();
    }
    return this.Ok(entity);
  }

  protected abstract DbSet<T> GetRepository();
}
