namespace PetsService.Domain;

using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Sieve.Models;

[Route("report_municipality"), ApiController, Authorize]
public class ReportMunicipalityController(ReportMunicipalityService service, IMapper mapper)
  : ControllerBase
{
  [HttpPost]
  public IActionResult Create([FromBody] ReportMunicipality view)
  {
    var report = mapper.Map<ReportMunicipality>(view);
    var result = service.Create(
      report.DateStart,
      report.DateEnd,
      report.Number,
      report.MunicipalityId
    );
    return this.Ok();
  }

  [HttpGet("{id}")]
  public IActionResult GetOne(long id)
  {
    var report = service.GetOne(id);
    if (report is null)
    {
      return this.NotFound();
    }
    return this.Ok(report);
  }

  [HttpGet]
  public IActionResult GetList([FromQuery] SieveModel param) => this.Ok(service.GetList(param));

  [HttpDelete("{id}")]
  public IActionResult Delete(long id)
  {
    service.Delete(id);
    return this.Ok();
  }

  [HttpPut("{id}")]
  public IActionResult UpdateStatus(long id, [FromBody] ReportMunicipalityStatusView view)
  {
    var result = service.UpdateStatus(id, view.StatusId);
    return this.Ok(result);
  }
}
