namespace PetsService.Domain;

public class ContractView
{
  public long Id { get; set; }

  public required string Num { get; set; }

  public DateOnly ConclusionDate { get; set; }

  public DateOnly CompetitionDate { get; set; }

  public long CustomerId { get; set; }

  public long ContractorId { get; set; }

  public required ICollection<ContractCostView> ContractCosts { get; set; }
}
