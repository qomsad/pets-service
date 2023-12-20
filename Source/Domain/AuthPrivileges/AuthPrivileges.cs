namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Table("auth_privileges")]
public class AuthPrivileges
{
  [Column("id"), Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
  public long Id { get; set; }

  [Column("entity")]
  public required string Entity { get; set; }

  [Column("possibility")]
  public required string Possibility { get; set; }

  [Column("restriction")]
  public required string Restriction { get; set; }

  [Column("role_id")]
  public long AuthRoleId { get; set; }
}
