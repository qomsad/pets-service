namespace PetsService;

using Microsoft.EntityFrameworkCore;
using PetsService.Config;
using PetsService.Infrastructure;
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
  }

  public void Configure(IApplicationBuilder app)
  {
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
