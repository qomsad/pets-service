namespace PetsService.Domain;

public class OrganizationView
{
  public long Id { get; set; }
  public string? Name { get; set; }
  public string? INN { get; set; }
  public string? KPP { get; set; }
  public string? Address { get; set; }
  public long OrganizationTypeId { get; set; }
  public long LegalTypeId { get; set; }
  public long MunicipalityId { get; set; }
}
