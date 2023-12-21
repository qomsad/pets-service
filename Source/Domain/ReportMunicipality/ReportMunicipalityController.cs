namespace PetsService.Domain;

using System.Text.Json;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PetsService.Infrastructure;
using Sieve.Models;

[Route("report_municipality"), ApiController, Authorize]
public class ReportMunicipalityController(
  ReportMunicipalityService service,
  IMapper mapper,
  LogInfoService log
) : ControllerBase
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
    log.Write(
      this.User.Identity!.Name,
      JsonSerializer.Serialize(result),
      nameof(ReportMunicipality),
      result.Id,
      nameof(this.Create)
    );
    return this.Ok(result);
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
    log.Write(this.User.Identity!.Name, "", nameof(ReportMunicipality), id, nameof(this.Delete));
    return this.Ok();
  }

  [HttpPut("{id}")]
  public IActionResult UpdateStatus(long id, [FromBody] ReportMunicipalityStatusView view)
  {
    var result = service.UpdateStatus(id, view.StatusId);
    log.Write(
      this.User.Identity!.Name,
      JsonSerializer.Serialize(result),
      nameof(ReportMunicipality),
      result!.Id,
      nameof(this.UpdateStatus)
    );
    return this.Ok(result);
  }
}
