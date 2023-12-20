namespace PetsService.Domain;

public class ReportMunicipalityView
{
  public long Id { get; set; }

  public int Number { get; set; }

  public DateOnly DateStart { get; set; }

  public DateOnly DateEnd { get; set; }

  public long MunicipalityId { get; set; }
}
