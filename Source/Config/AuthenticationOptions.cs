namespace PetsService.Config;

using System.Text;
using Microsoft.IdentityModel.Tokens;

public class AuthenticationOptions
{
  public required string Issuer { get; set; }
  public required string Audience { get; set; }
  public required string Key { get; set; }
  public required int ExpirationInMinutes { get; set; }

  public SymmetricSecurityKey GetSymmetricSecurityKey() => new(Encoding.UTF8.GetBytes(this.Key));
}
