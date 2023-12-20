namespace PetsService.Domain;

public class CatchActCardView
{
  public long Id { get; set; }

  public required string Sex { get; set; }

  public string? Breed { get; set; }

  public string? Size { get; set; }

  public string? Wool { get; set; }

  public string? Color { get; set; }

  public string? Ears { get; set; }

  public string? Tail { get; set; }

  public string? SpecialSigns { get; set; }

  public string? IdentificationLabel { get; set; }

  public string? ChipNumber { get; set; }
}
