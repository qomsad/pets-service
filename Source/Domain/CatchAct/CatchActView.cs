namespace PetsService.Domain;

public class CatchActView
{
  public long Id { get; set; }

  public long OrganizationId { get; set; }

  public long MunicipalityId { get; set; }

  public long ContractId { get; set; }

  public DateOnly CaptureDate { get; set; }

  public required ICollection<CatchActCard> CatchActCards { get; set; }
}
