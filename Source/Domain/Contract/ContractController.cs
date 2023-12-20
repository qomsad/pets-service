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
    service.Create(contract);
    return this.Ok();
  }

  [HttpGet("{id}")]
  public IActionResult GetOne(long id)
  {
    var contract = service.GetOne(id);
    if (contract is null)
    {
      return this.NotFound();
    }
    return this.Ok(contract);
  }

  [HttpGet]
  public IActionResult GetList([FromQuery] SieveModel param) => this.Ok(service.GetList(param));

  [HttpPut("{id}")]
  public IActionResult Update(long id, [FromBody] ContractView view)
  {
    var contract = mapper.Map<Contract>(view);
    contract.Id = id;
    service.Update(contract);
    return this.Ok();
  }

  [HttpDelete]
  public IActionResult Delete(long id)
  {
    var contract = service.GetOne(id);
    if (contract is null)
    {
      return this.NotFound();
    }
    service.Delete(contract);

    return this.Ok();
  }
}
