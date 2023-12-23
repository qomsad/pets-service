namespace PetsService.Domain;

using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PetsService.Security;
using Sieve.Models;

[Route("organizations"), ApiController, Authorize]
public class OrganizationController(
  OrganizationService service,
  IMapper mapper,
  PermissionService permissions
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

    return this.Ok();
  }
}
