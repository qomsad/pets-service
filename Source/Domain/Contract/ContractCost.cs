namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Table("contract_cost")]
public class ContractCost
{
  [Column("id"), Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
  public long Id { get; set; }

  [Column("price")]
  public double Price { get; set; }

  [Column("contract_id")]
  public long ContractId { get; set; }

  [Column("municipality_id")]
  public long MunicipalityId { get; set; }

  [ForeignKey(nameof(MunicipalityId))]
  public required DictMunicipality Municipality { get; set; }
}
