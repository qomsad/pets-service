namespace PetsService.Domain;

using System.Text.Json;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PetsService.Infrastructure;
using PetsService.Security;
using Sieve.Models;

[Route("contracts"), ApiController, Authorize]
public class ContractController(
  ContractService service,
  IMapper mapper,
  PermissionService permissions,
  LogInfoService log
) : ControllerBase
{
  [HttpPost]
  public IActionResult Create([FromBody] ContractView view)
  {
    if (!permissions.CanCreate(this.User.Identity, "CONTRACT"))
    {
      return this.NoPermissions();
    }
    var contract = mapper.Map<Contract>(view);
    var result = service.Create(contract);
    log.Write(
      this.User.Identity!.Name,
      JsonSerializer.Serialize(result),
      nameof(Contract),
      result.Id,
      nameof(this.Create)
    );
    return this.Ok(result);
  }

  [HttpGet("{id}")]
  public IActionResult GetOne(long id)
  {
    var contract = service.GetOne(id, this.User.Identity);
    if (contract is null)
    {
      return this.NotFound();
    }
    return this.Ok(contract);
  }

  [HttpGet]
  public IActionResult GetList([FromQuery] SieveModel param) =>
    this.Ok(service.GetList(param, this.User.Identity));

  [HttpPut("{id}")]
  public IActionResult Update(long id, [FromBody] ContractView view)
  {
    if (!permissions.CanUpdate(this.User.Identity, "CONTRACT"))
    {
      return this.NoPermissions();
    }
    var contract = mapper.Map<Contract>(view);
    contract.Id = id;
    var result = service.Update(contract);
    log.Write(
      this.User.Identity!.Name,
      JsonSerializer.Serialize(result),
      nameof(Contract),
      result.Id,
      nameof(this.Update)
    );
    return this.Ok(result);
  }

  [HttpDelete("{id}")]
  public IActionResult Delete(long id)
  {
    if (!permissions.CanDelete(this.User.Identity, "CONTRACT"))
    {
      return this.NoPermissions();
    }
    var contract = service.GetOne(id, this.User.Identity);
    if (contract is null)
    {
      return this.NotFound();
    }
    service.Delete(contract);
    log.Write(
      this.User.Identity!.Name,
      JsonSerializer.Serialize(contract),
      nameof(Contract),
      contract.Id,
      nameof(this.Delete)
    );
    return this.Ok();
  }
}
