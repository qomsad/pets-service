namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Sieve.Attributes;

[Table("catch_schedule_status")]
public class CatchScheduleStatus
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
