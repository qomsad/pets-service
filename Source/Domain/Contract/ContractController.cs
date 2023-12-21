namespace PetsService.Domain;

using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Sieve.Models;

[Route("contracts"), ApiController, Authorize]
public class ContractController(ContractService service, IMapper mapper) : ControllerBase
{
  [HttpPost]
  public IActionResult Create([FromBody] ContractView view)
  {
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
    var contract = mapper.Map<Contract>(view);
    contract.Id = id;
    var result = service.Update(contract);
    return this.Ok(result);
  }

  [HttpDelete("{id}")]
  public IActionResult Delete(long id)
  {
    var contract = service.GetOne(id, this.User.Identity);
    if (contract is null)
    {
      return this.NotFound();
    }
    service.Delete(contract);

    return this.Ok();
  }
}
