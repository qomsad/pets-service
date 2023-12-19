namespace PetsService.Config;

using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;

public static class AuthenticationConfig
{
  public static void ConfigureAuthentication(this IServiceCollection services, IConfiguration c) =>
    services
      .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
      .AddJwtBearer(options =>
      {
        var config =
          c.GetSection("AuthenticationOptions").Get<AuthenticationOptions>()
          ?? throw new ArgumentNullException(
            nameof(c),
            "AuthenticationOptions in appsettings.json is null"
          );
        options.RequireHttpsMetadata = false;
        options.TokenValidationParameters = new TokenValidationParameters
        {
          ValidateIssuer = true,
          ValidIssuer = config.Issuer,
          ValidateAudience = true,
          ValidAudience = config.Audience,
          ValidateLifetime = true,
          IssuerSigningKey = config.GetSymmetricSecurityKey(),
          ValidateIssuerSigningKey = true,
        };
      });
}
