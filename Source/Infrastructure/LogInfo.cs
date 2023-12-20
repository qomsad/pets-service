namespace PetsService.Infrastructure;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Table("log_info")]
public class LogInfo
{
  [Column("id"), Key, DatabaseGenerated(DatabaseGeneratedOption.Identity),]
  public long Id { get; set; }

  [Column("user")]
  public string? User { get; set; }

  [Column("action_date")]
  public DateTime ActionDate { get; set; }

  [Column("action")]
  public string? Action { get; set; }

  [Column("entity")]
  public string? Entity { get; set; }

  [Column("registry")]
  public string? Registry { get; set; }

  [Column("id_object")]
  public long ObjectId { get; set; }
}
