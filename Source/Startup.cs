namespace PetsService;

using Microsoft.EntityFrameworkCore;
using PetsService.Config;
using PetsService.Domain;
using PetsService.Infrastructure;
using PetsService.Security;
using Sieve.Services;

public class Startup
{
  public IConfigurationRoot Configuration { get; set; }

  public Startup(IWebHostEnvironment env)
  {
    var builder = new ConfigurationBuilder()
      .SetBasePath(env.ContentRootPath)
      .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
    this.Configuration = builder.Build();
  }

  public void ConfigureServices(IServiceCollection services)
  {
    services.Configure<AuthenticationOptions>(
      this.Configuration.GetSection("AuthenticationOptions")
    );
    services.ConfigureAuthentication(this.Configuration);
    services.AddAuthorization();
    services.AddControllers();
    services.ConfigureCors();
    services.ConfigureSwagger();

    services.AddDbContext<DatabaseContext>(
      options => options.UseNpgsql(this.Configuration.GetConnectionString("pets"))
    );
    services.AddScoped<ISieveProcessor, ApplicationSieveProcessor>();
    services.AddAutoMapper(typeof(MapperProfile));

    services.AddScoped<OrganizationService>();
    services.AddScoped<AuthenticationService>();
    services.AddScoped<ContractService>();
    services.AddScoped<CatchActService>();
    services.AddScoped<CatchScheduleService>();
    services.AddScoped<ReportMunicipalityService>();

    services.AddScoped<AuthUserService>();
    services.AddScoped<LogInfoService>();
  }

  public void Configure(IApplicationBuilder app)
  {
    AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
    app.UseCors("Default");
    app.UseRouting();
    app.UseAuthentication();
    app.UseAuthorization();
    app.UseEndpoints(endpoints => endpoints.MapControllers());
    app.UseSwagger();
    app.UseSwaggerUI();
    app.UseDefaultFiles();
    app.UseStaticFiles();
  }
}
