namespace PetsService.Infrastructure;

using Microsoft.EntityFrameworkCore;
using PetsService.Domain;

public class DatabaseContext(DbContextOptions<DatabaseContext> context) : DbContext(context)
{
  public DbSet<DictLegalType> DictLegalType { get; set; }
  public DbSet<DictMunicipality> DictMunicipality { get; set; }
  public DbSet<DictOrganizationType> DictOrganizationType { get; set; }
  public DbSet<Organization> Organization { get; set; }
  public DbSet<AuthPrivileges> AuthPrivileges { get; set; }
  public DbSet<AuthRole> AuthRole { get; set; }
  public DbSet<AuthUser> AuthUser { get; set; }
  public DbSet<ContractCost> ContractCost { get; set; }
  public DbSet<Contract> Contract { get; set; }
  public DbSet<CatchActCard> CatchActCard { get; set; }
  public DbSet<CatchAct> CatchAct { get; set; }
}
