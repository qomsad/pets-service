namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Sieve.Attributes;

public class BaseDict
{
  [
    Column("id"),
    Key,
    DatabaseGenerated(DatabaseGeneratedOption.Identity),
    Sieve(CanSort = true, CanFilter = true)
  ]
  public long Id { get; set; }

  [Column("record_name"), Sieve(CanSort = true, CanFilter = true)]
  public required string Value { get; set; }
}
