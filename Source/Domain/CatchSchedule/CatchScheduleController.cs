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
    catchSchedule.StatusId = 1;
    var result = service.Create(catchSchedule);
    return this.Ok(result);
  }

  [HttpGet("{id}")]
  public IActionResult GetOne(long id)
  {
    var catchSchedule = service.GetOne(id, this.User.Identity);
    if (catchSchedule is null)
    {
      return this.NotFound();
    }
    return this.Ok(catchSchedule);
  }

  [HttpGet]
  public IActionResult GetList([FromQuery] SieveModel param) =>
    this.Ok(service.GetList(param, this.User.Identity));

  [HttpPut("{id}")]
  public IActionResult Update(long id, [FromBody] CatchScheduleView view)
  {
    var catchSchedule = mapper.Map<CatchSchedule>(view);
    catchSchedule.Id = id;
    var result = service.Update(catchSchedule);
    return this.Ok(result);
  }

  [HttpDelete("{id}")]
  public IActionResult Delete(long id)
  {
    var catchSchedule = service.GetOne(id, this.User.Identity);
    if (catchSchedule is null)
    {
      return this.NotFound();
    }
    service.Delete(catchSchedule);

    return this.Ok();
  }
}
