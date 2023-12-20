namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Sieve.Attributes;

[Table("report_municipality")]
public class ReportMunicipality
{
  [
    Column("id"),
    Key,
    DatabaseGenerated(DatabaseGeneratedOption.Identity),
    Sieve(CanSort = true, CanFilter = true)
  ]
  public long Id { get; set; }

  [Column("number"), Sieve(CanSort = true, CanFilter = true)]
  public int Number { get; set; }

  [Column("date_start"), Sieve(CanSort = true, CanFilter = true)]
  public DateOnly DateStart { get; set; }

  [Column("date_end"), Sieve(CanSort = true, CanFilter = true)]
  public DateOnly DateEnd { get; set; }

  [Column("status_id"), Sieve(CanSort = true, CanFilter = true)]
  public long StatusId { get; set; }

  [ForeignKey(nameof(StatusId))]
  public ReportMunicipalityStatus? Status { get; set; }

  [Column("date_status"), Sieve(CanSort = true, CanFilter = true)]
  public DateTime DateStatus { get; set; }

  [Column("total_cost"), Sieve(CanSort = true, CanFilter = true)]
  public double TotalCost { get; set; }

  [Column("municipality_id"), Sieve(CanSort = true, CanFilter = true)]
  public long MunicipalityId { get; set; }

  [ForeignKey(nameof(MunicipalityId))]
  public DictMunicipality? Municipality { get; set; }

  [Column("number_of_animals"), Sieve(CanSort = true, CanFilter = true)]
  public int NumberOfAnimals { get; set; }
}
