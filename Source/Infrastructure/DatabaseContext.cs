namespace PetsService.Infrastructure;

using Microsoft.EntityFrameworkCore;
using PetsService.Domain;

public class DatabaseContext(DbContextOptions<DatabaseContext> context) : DbContext(context)
{
  public DbSet<DictLegalType> DictLegalType { get; set; }
  public DbSet<DictMunicipality> DictMunicipality { get; set; }
  public DbSet<DictOrganizationType> DictOrganizationType { get; set; }
  public DbSet<Organization> Organization { get; set; }
}
