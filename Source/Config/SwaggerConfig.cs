namespace PetsService.Config;

using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.OpenApi.Models;

public static class SwaggerConfig
{
  private static readonly OpenApiSecurityScheme SECURITY_SCHEME =
    new()
    {
      BearerFormat = "JWT",
      Name = "Аутентификация",
      In = ParameterLocation.Header,
      Type = SecuritySchemeType.Http,
      Scheme = JwtBearerDefaults.AuthenticationScheme,
      Description = "Токен",
      Reference = new OpenApiReference
      {
        Id = JwtBearerDefaults.AuthenticationScheme,
        Type = ReferenceType.SecurityScheme
      }
    };

  public static void ConfigureSwagger(this IServiceCollection services) =>
    services
      .AddEndpointsApiExplorer()
      .AddSwaggerGen(setup =>
      {
        setup.AddSecurityDefinition(SECURITY_SCHEME.Reference.Id, SECURITY_SCHEME);
        setup.AddSecurityRequirement(
          new OpenApiSecurityRequirement { { SECURITY_SCHEME, Array.Empty<string>() } }
        );
      });
}
