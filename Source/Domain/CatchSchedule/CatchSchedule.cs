namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Sieve.Attributes;

[Table("catch_schedule")]
public class CatchSchedule
{
  [
    Column("id"),
    Key,
    DatabaseGenerated(DatabaseGeneratedOption.Identity),
    Sieve(CanSort = true, CanFilter = true)
  ]
  public long Id { get; set; }

  [Column("month"), Sieve(CanSort = true, CanFilter = true)]
  public int Month { get; set; }

  [Column("year"), Sieve(CanSort = true, CanFilter = true)]
  public int Year { get; set; }

  [Column("status_id"), Sieve(CanSort = true, CanFilter = true)]
  public long StatusId { get; set; }

  [ForeignKey(nameof(StatusId))]
  public required CatchScheduleStatus Status { get; set; }
}
