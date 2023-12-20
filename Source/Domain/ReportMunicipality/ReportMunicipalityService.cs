namespace PetsService.Domain;

using Microsoft.EntityFrameworkCore;
using PetsService.Infrastructure;
using Sieve.Models;
using Sieve.Services;

public class ReportMunicipalityService(DatabaseContext repository, ISieveProcessor sieve)
{
  public void Create(DateOnly from, DateOnly to, int number, long municipalityId)
  {
    var acts = repository
      .CatchAct
      .Include(e => e.CatchActCards)
      .Where(a => a.CaptureDate > from && a.CaptureDate < to && a.MunicipalityId == municipalityId)
      .ToList();

    var num = 0;
    foreach (var a in acts)
    {
      if (a.CatchActCards is not null)
      {
        num += a.CatchActCards.Count;
      }
    }
    var costs = repository.ContractCost.Where(a => a.MunicipalityId == municipalityId);
    var cost = 0.0;
    foreach (var c in costs)
    {
      if (c is not null)
      {
        var aa = acts.Find(x => x.ContractId == c.ContractId);
        if (aa is not null)
        {
          if (aa.CatchActCards is not null)
          {
            cost += c.Price * aa.CatchActCards.Count;
          }
        }
      }
    }

    var report = new ReportMunicipality
    {
      DateStart = from,
      DateEnd = to,
      Number = number,
      DateStatus = DateTime.Now,
      StatusId = 1,
      MunicipalityId = municipalityId,
      NumberOfAnimals = num,
      TotalCost = cost
    };
    repository.ReportMunicipality.Add(report);
    repository.SaveChanges();
  }

  public void Delete(long id)
  {
    var entity = repository.ReportMunicipality.Find(id);
    if (entity is not null)
    {
      repository.ReportMunicipality.Remove(entity);
    }
  }

  public Pagination<ReportMunicipality> GetList(SieveModel param)
  {
    var rep = repository.ReportMunicipality.Include(e => e.Status).Include(e => e.Municipality);
    var data = sieve.Apply(param, rep);
    var total = sieve.Apply(new SieveModel { Filters = param.Filters }, rep).Count();
    return new Pagination<ReportMunicipality> { Data = data, Total = total };
  }

  public ReportMunicipality? GetOne(long id) =>
    repository
      .ReportMunicipality
      .Include(e => e.Status)
      .Include(e => e.Municipality)
      .FirstOrDefault(o => o.Id == id);

  public ReportMunicipality? UpdateStatus(long id, long status)
  {
    var report = repository.ReportMunicipality.Find(id);

    if (report is not null)
    {
      report.StatusId = status;
    }
    repository.SaveChanges();
    return report;
  }
}
