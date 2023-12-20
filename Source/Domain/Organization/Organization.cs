namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Sieve.Attributes;

[Table("organization")]
public class Organization
{
  [
    Column("id"),
    Key,
    DatabaseGenerated(DatabaseGeneratedOption.Identity),
    Sieve(CanSort = true, CanFilter = true)
  ]
  public long Id { get; set; }

  [Column("name"), Sieve(CanSort = true, CanFilter = true)]
  public string? Name { get; set; }

  [Column("inn"), Sieve(CanSort = true, CanFilter = true)]
  public string? INN { get; set; }

  [Column("kpp"), Sieve(CanSort = true, CanFilter = true)]
  public string? KPP { get; set; }

  [Column("address"), Sieve(CanSort = true, CanFilter = true)]
  public string? Address { get; set; }

  [Column("organization_type_id"), Sieve(CanSort = true, CanFilter = true)]
  public long OrganizationTypeId { get; set; }

  [ForeignKey(nameof(OrganizationTypeId))]
  public required DictOrganizationType OrganizationType { get; set; }

  [Column("legal_type_id"), Sieve(CanSort = true, CanFilter = true)]
  public long LegalTypeId { get; set; }

  [ForeignKey(nameof(LegalTypeId))]
  public required DictLegalType LegalType { get; set; }

  [Column("municipality_id"), Sieve(CanSort = true, CanFilter = true)]
  public long MunicipalityId { get; set; }

  [ForeignKey(nameof(MunicipalityId))]
  public required DictMunicipality Municipality { get; set; }
}
