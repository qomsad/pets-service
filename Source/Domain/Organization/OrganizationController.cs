namespace PetsService.Domain;

using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Sieve.Models;

[Route("organizations"), ApiController]
public class OrganizationController(OrganizationService service, IMapper mapper) : ControllerBase
{
  [HttpPost]
  public IActionResult Create([FromBody] OrganizationView view)
  {
    var organization = mapper.Map<Organization>(view);
    service.Create(organization);
    return this.Ok();
  }

  [HttpGet("{id}")]
  public IActionResult GetOne(long id)
  {
    var organization = service.GetOne(id);
    if (organization is null)
    {
      return this.NotFound();
    }
    return this.Ok(organization);
  }

  [HttpGet]
  public IActionResult GetList([FromQuery] SieveModel param) => this.Ok(service.GetList(param));

  [HttpPut]
  public IActionResult Update(long id, [FromBody] OrganizationView view)
  {
    var organization = mapper.Map<Organization>(view);
    organization.Id = id;
    service.Update(organization);
    return this.Ok();
  }

  [HttpDelete]
  public IActionResult Delete(long id)
  {
    var organization = service.GetOne(id);
    if (organization is null)
    {
      return this.NotFound();
    }
    service.Delete(organization);

    return this.Ok();
  }
}
