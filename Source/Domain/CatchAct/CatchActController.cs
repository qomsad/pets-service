namespace PetsService.Domain;

using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Sieve.Models;

[Route("catch_acts"), ApiController, Authorize]
public class CatchActController(CatchActService service, IMapper mapper) : ControllerBase
{
  [HttpPost]
  public IActionResult Create([FromBody] CatchActView view)
  {
    var catchAct = mapper.Map<CatchAct>(view);
    var result = service.Create(catchAct);
    return this.Ok(result);
  }

  [HttpGet("{id}")]
  public IActionResult GetOne(long id)
  {
    var catchAct = service.GetOne(id);
    if (catchAct is null)
    {
      return this.NotFound();
    }
    return this.Ok(catchAct);
  }

  [HttpGet]
  public IActionResult GetList([FromQuery] SieveModel param) => this.Ok(service.GetList(param));

  [HttpPut("{id}")]
  public IActionResult Update(long id, [FromBody] CatchActView view)
  {
    var catchAct = mapper.Map<CatchAct>(view);
    catchAct.Id = id;
    var result = service.Update(catchAct);
    return this.Ok(result);
  }

  [HttpDelete("{id}")]
  public IActionResult Delete(long id)
  {
    var catchAct = service.GetOne(id);
    if (catchAct is null)
    {
      return this.NotFound();
    }
    service.Delete(catchAct);

    return this.Ok();
  }
}
