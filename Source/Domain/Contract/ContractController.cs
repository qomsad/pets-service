namespace PetsService.Domain;

using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PetsService.Security;
using Sieve.Models;

[Route("contracts"), ApiController, Authorize]
public class ContractController(
  ContractService service,
  IMapper mapper,
  PermissionService permissions
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
    return this.Ok();
  }
}
