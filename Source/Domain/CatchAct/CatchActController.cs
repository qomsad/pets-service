namespace PetsService.Domain;

using System.Text.Json;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PetsService.Infrastructure;
using PetsService.Security;
using Sieve.Models;

[Route("catch_acts"), ApiController, Authorize]
public class CatchActController(
  CatchActService service,
  IMapper mapper,
  PermissionService permissions,
  LogInfoService log
) : ControllerBase
{
  [HttpPost]
  public IActionResult Create([FromBody] CatchActView view)
  {
    if (!permissions.CanCreate(this.User.Identity, "CATCH_ACT"))
    {
      return this.NoPermissions();
    }
    var catchAct = mapper.Map<CatchAct>(view);
    var result = service.Create(catchAct);
    log.Write(
      this.User.Identity!.Name,
      JsonSerializer.Serialize(result),
      nameof(CatchAct),
      result.Id,
      nameof(this.Create)
    );
    return this.Ok(result);
  }

  [HttpGet("{id}")]
  public IActionResult GetOne(long id)
  {
    var catchAct = service.GetOne(id, this.User.Identity);
    if (catchAct is null)
    {
      return this.NotFound();
    }
    return this.Ok(catchAct);
  }

  [HttpGet]
  public IActionResult GetList([FromQuery] SieveModel param) =>
    this.Ok(service.GetList(param, this.User.Identity));

  [HttpPut("{id}")]
  public IActionResult Update(long id, [FromBody] CatchActView view)
  {
    if (!permissions.CanUpdate(this.User.Identity, "CATCH_ACT"))
    {
      return this.NoPermissions();
    }
    var catchAct = mapper.Map<CatchAct>(view);
    catchAct.Id = id;
    var result = service.Update(catchAct);
    log.Write(
      this.User.Identity!.Name,
      JsonSerializer.Serialize(result),
      nameof(CatchAct),
      result.Id,
      nameof(this.Update)
    );
    return this.Ok(result);
  }

  [HttpDelete("{id}")]
  public IActionResult Delete(long id)
  {
    if (!permissions.CanDelete(this.User.Identity, "CATCH_ACT"))
    {
      return this.NoPermissions();
    }
    var catchAct = service.GetOne(id, this.User.Identity);
    if (catchAct is null)
    {
      return this.NotFound();
    }
    service.Delete(catchAct);
    log.Write(
      this.User.Identity!.Name,
      JsonSerializer.Serialize(catchAct),
      nameof(CatchAct),
      catchAct.Id,
      nameof(this.Delete)
    );
    return this.Ok();
  }
}
