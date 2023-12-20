namespace PetsService.Domain;

using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Sieve.Models;

[Route("catch_schedule"), ApiController, Authorize]
public class CatchScheduleController(CatchScheduleService service, IMapper mapper) : ControllerBase
{
  [HttpPost]
  public IActionResult Create([FromBody] CatchScheduleView view)
  {
    var catchSchedule = mapper.Map<CatchSchedule>(view);
    service.Create(catchSchedule);
    return this.Ok();
  }

  [HttpGet("{id}")]
  public IActionResult GetOne(long id)
  {
    var catchSchedule = service.GetOne(id);
    if (catchSchedule is null)
    {
      return this.NotFound();
    }
    return this.Ok(catchSchedule);
  }

  [HttpGet]
  public IActionResult GetList([FromQuery] SieveModel param) => this.Ok(service.GetList(param));

  [HttpPut("{id}")]
  public IActionResult Update(long id, [FromBody] CatchScheduleView view)
  {
    var catchSchedule = mapper.Map<CatchSchedule>(view);
    catchSchedule.Id = id;
    service.Update(catchSchedule);
    return this.Ok();
  }

  [HttpDelete]
  public IActionResult Delete(long id)
  {
    var catchSchedule = service.GetOne(id);
    if (catchSchedule is null)
    {
      return this.NotFound();
    }
    service.Delete(catchSchedule);

    return this.Ok();
  }
}
