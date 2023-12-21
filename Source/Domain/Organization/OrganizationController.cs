namespace PetsService.Domain;

using System.Text.Json;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PetsService.Infrastructure;
using PetsService.Security;
using Sieve.Models;

[Route("organizations"), ApiController, Authorize]
public class OrganizationController(
  OrganizationService service,
  IMapper mapper,
  PermissionService permissions,
  LogInfoService log
) : ControllerBase
{
  [HttpPost]
  public IActionResult Create([FromBody] OrganizationView view)
  {
    if (!permissions.CanCreate(this.User.Identity, "ORGANIZATION"))
    {
      return this.NoPermissions();
    }
    var organization = mapper.Map<Organization>(view);
    var result = service.Create(organization);
    log.Write(
      this.User.Identity!.Name,
      JsonSerializer.Serialize(result),
      nameof(Organization),
      result.Id,
      nameof(this.Create)
    );
    return this.Ok(result);
  }

  [HttpGet("{id}")]
  public IActionResult GetOne(long id)
  {
    var organization = service.GetOne(id, this.User.Identity);
    if (organization is null)
    {
      return this.NotFound();
    }
    return this.Ok(organization);
  }

  [HttpGet]
  public IActionResult GetList([FromQuery] SieveModel param) =>
    this.Ok(service.GetList(param, this.User.Identity));

  [HttpPut("{id}")]
  public IActionResult Update(long id, [FromBody] OrganizationView view)
  {
    if (!permissions.CanUpdate(this.User.Identity, "ORGANIZATION"))
    {
      return this.NoPermissions();
    }
    var organization = mapper.Map<Organization>(view);
    organization.Id = id;
    var result = service.Update(organization);
    log.Write(
      this.User.Identity!.Name,
      JsonSerializer.Serialize(result),
      nameof(Organization),
      result.Id,
      nameof(this.Update)
    );
    return this.Ok(result);
  }

  [HttpDelete("{id}")]
  public IActionResult Delete(long id)
  {
    if (!permissions.CanDelete(this.User.Identity, "ORGANIZATION"))
    {
      return this.NoPermissions();
    }
    var organization = service.GetOne(id, this.User.Identity);
    if (organization is null)
    {
      return this.NotFound();
    }
    service.Delete(organization);
    log.Write(
      this.User.Identity!.Name,
      JsonSerializer.Serialize(organization),
      nameof(Organization),
      organization.Id,
      nameof(this.Delete)
    );

    return this.Ok();
  }
}
