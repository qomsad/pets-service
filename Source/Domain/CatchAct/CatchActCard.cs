namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Sieve.Attributes;

[Table("catch_act_card")]
public class CatchActCard
{
  [
    Column("id"),
    Key,
    DatabaseGenerated(DatabaseGeneratedOption.Identity),
    Sieve(CanSort = true, CanFilter = true)
  ]
  public long Id { get; set; }

  [Column("category"), Sieve(CanSort = true, CanFilter = true)]
  public required string Category { get; set; }

  [Column("sex"), Sieve(CanSort = true, CanFilter = true)]
  public required string Sex { get; set; }

  [Column("breed"), Sieve(CanSort = true, CanFilter = true)]
  public string? Breed { get; set; }

  [Column("size"), Sieve(CanSort = true, CanFilter = true)]
  public string? Size { get; set; }

  [Column("wool"), Sieve(CanSort = true, CanFilter = true)]
  public string? Wool { get; set; }

  [Column("color"), Sieve(CanSort = true, CanFilter = true)]
  public string? Color { get; set; }

  [Column("ears"), Sieve(CanSort = true, CanFilter = true)]
  public string? Ears { get; set; }

  [Column("tail"), Sieve(CanSort = true, CanFilter = true)]
  public string? Tail { get; set; }

  [Column("special_signs")]
  public string? SpecialSigns { get; set; }

  [Column("tag"), Sieve(CanSort = true, CanFilter = true)]
  public string? IdentificationLabel { get; set; }

  [Column("chip_number"), Sieve(CanSort = true, CanFilter = true)]
  public string? ChipNumber { get; set; }

  [Column("act_id")]
  public long CatchActId { get; set; }
}
