namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Sieve.Attributes;

[Table("contract")]
public class Contract
{
  [
    Column("id"),
    Key,
    DatabaseGenerated(DatabaseGeneratedOption.Identity),
    Sieve(CanSort = true, CanFilter = true)
  ]
  public long Id { get; set; }

  [Column("num"), Sieve(CanSort = true, CanFilter = true)]
  public required string Num { get; set; }

  [Column("conclusion_date"), Sieve(CanSort = true, CanFilter = true)]
  public DateOnly ConclusionDate { get; set; }

  [Column("completion_date"), Sieve(CanSort = true, CanFilter = true)]
  public DateOnly CompetitionDate { get; set; }

  [Column("customer_id"), Sieve(CanSort = true, CanFilter = true)]
  public long CustomerId { get; set; }

  [ForeignKey(nameof(CustomerId))]
  public required Organization Customer { get; set; }

  [Column("contractor_id"), Sieve(CanSort = true, CanFilter = true)]
  public long ContractorId { get; set; }

  [ForeignKey(nameof(ContractorId))]
  public required Organization Contractor { get; set; }

  public required ICollection<ContractCost> ContractCosts { get; set; }
}
