namespace PetsService.Infrastructure;

using System.Security.Principal;
using PetsService.Security;
using Sieve.Models;
using Sieve.Services;

public abstract class BaseService<T>(
  DatabaseContext context,
  ISieveProcessor sieve,
  PermissionService permission
)
  where T : class
{
  protected DatabaseContext Context { get; } = context;
  protected ISieveProcessor Sieve { get; } = sieve;
  protected PermissionService Permissions { get; } = permission;

  public T Create(T entity)
  {
    this.Context.Add(entity);
    this.Context.SaveChanges();
    return entity;
  }

  public abstract T? GetOne(long id, IIdentity? identity);

  public abstract Pagination<T> GetList(SieveModel param, IIdentity? identity);

  public void Delete(T entity)
  {
    this.Context.Remove(entity);
    this.Context.SaveChanges();
  }

  public T Update(T entity)
  {
    this.Context.Update(entity);
    this.Context.SaveChanges();
    return entity;
  }
}
