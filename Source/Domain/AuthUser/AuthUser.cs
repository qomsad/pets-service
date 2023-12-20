namespace PetsService.Domain;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Table("auth_user")]
public class AuthUser
{
  [Column("id"), Key, DatabaseGenerated(DatabaseGeneratedOption.Identity),]
  public long Id { get; set; }

  [Column("login")]
  public required string Login { get; set; }

  [Column("password")]
  public required string Password { get; set; }

  [Column("municipality_id")]
  public long? MunicipalityId { get; set; }

  [ForeignKey(nameof(MunicipalityId))]
  public DictMunicipality? Municipality { get; set; }

  [Column("organization_id")]
  public long? OrganizationId { get; set; }

  [ForeignKey(nameof(OrganizationId))]
  public Organization? Organization { get; set; }

  [Column("role_id")]
  public long AuthRoleId { get; set; }

  [ForeignKey(nameof(AuthRoleId))]
  public required AuthRole Role { get; set; }

  [Column("first_name")]
  public required string FirstName { get; set; }

  [Column("last_name")]
  public string? LastName { get; set; }

  [Column("middle_name")]
  public string? MiddleName { get; set; }

  [Column("email")]
  public string? Email { get; set; }
}
