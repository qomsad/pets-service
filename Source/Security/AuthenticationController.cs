namespace PetsService.Security;

using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using PetsService.Config;

[Route("login"), ApiController]
public class AuthenticationController(IConfiguration configuration, AuthenticationService service)
  : ControllerBase
{
  private readonly AuthenticationOptions config =
    configuration.GetSection("AuthenticationOptions").Get<AuthenticationOptions>()
    ?? throw new ArgumentNullException(
      nameof(configuration),
      "AuthenticationOptions in appsettings.json is null"
    );

  [HttpPost]
  public IActionResult Login([FromBody] LoginUser login)
  {
    var user = service.GetUser(login.Login);

    if (user is null || user.Password != login.Password)
    {
      return this.Unauthorized();
    }

    var token = new JwtSecurityToken(
      issuer: this.config.Issuer,
      audience: this.config.Audience,
      claims: new List<Claim> { new(ClaimTypes.Name, user.Login) },
      expires: DateTime.UtcNow.Add(TimeSpan.FromMinutes(this.config.ExpirationInMinutes)),
      signingCredentials: new SigningCredentials(
        this.config.GetSymmetricSecurityKey(),
        SecurityAlgorithms.HmacSha256
      )
    );
    var access = new JwtSecurityTokenHandler().WriteToken(token);
    return this.Ok(new { access_token = access, login = user.Login });
  }
}

public class LoginUser
{
  public required string Login { get; set; }
  public required string Password { get; set; }
}
