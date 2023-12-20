namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Table("auth_role")]
public class AuthRole
{
  [Column("id"), Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
  public long Id { get; set; }

  [Column("role_name")]
  public required string Name { get; set; }

  public required ICollection<AuthPrivileges> Privileges { get; set; }
}
