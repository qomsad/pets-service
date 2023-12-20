namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Sieve.Attributes;

[Table("catch_act")]
public class CatchAct
{
  [
    Column("id"),
    Key,
    DatabaseGenerated(DatabaseGeneratedOption.Identity),
    Sieve(CanSort = true, CanFilter = true)
  ]
  public long Id { get; set; }

  [Column("organization_id"), Sieve(CanSort = true, CanFilter = true)]
  public long OrganizationId { get; set; }

  [ForeignKey(nameof(OrganizationId))]
  public required Organization Organization { get; set; }

  [Column("municipality_id"), Sieve(CanSort = true, CanFilter = true)]
  public long MunicipalityId { get; set; }

  [ForeignKey(nameof(MunicipalityId))]
  public required DictMunicipality Municipality { get; set; }

  [Column("contract_id"), Sieve(CanSort = true, CanFilter = true)]
  public long ContractId { get; set; }

  [ForeignKey(nameof(ContractId))]
  public required Contract Contract { get; set; }

  [Column("capture_date"), Sieve(CanSort = true, CanFilter = true)]
  public DateOnly CaptureDate { get; set; }

  public required ICollection<CatchActCard> CatchActCards { get; set; }
}
