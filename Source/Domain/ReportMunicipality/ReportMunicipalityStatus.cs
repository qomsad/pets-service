namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Sieve.Attributes;

[Table("report_municipality_status")]
public class ReportMunicipalityStatus
{
  [
    Column("id"),
    Key,
    DatabaseGenerated(DatabaseGeneratedOption.Identity),
    Sieve(CanSort = true, CanFilter = true)
  ]
  public long Id { get; set; }

  [Column("status_name"), Sieve(CanSort = true, CanFilter = true)]
  public required string StatusName { get; set; }
}
