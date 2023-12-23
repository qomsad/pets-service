namespace PetsService.Infrastructure;

using System.Security.Principal;
using System.Text.Json;
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
  private readonly LogInfoService log = new(context, sieve);
  private readonly HttpContextAccessor http = new();

  public T Create(T entity)
  {
    this.Context.Add(entity);
    this.Context.SaveChanges();
    this.Log(entity, nameof(this.Create));
    return entity;
  }

  public abstract T? GetOne(long id, IIdentity? identity);

  public abstract Pagination<T> GetList(SieveModel param, IIdentity? identity);

  public void Delete(T entity)
  {
    this.Context.Remove(entity);
    this.Context.SaveChanges();
    this.Log(entity, nameof(this.Delete));
  }

  public T Update(T entity)
  {
    this.Context.Update(entity);
    this.Context.SaveChanges();
    this.Log(entity, nameof(this.Update));
    return entity;
  }

  private void Log(T entity, string action)
  {
    long id = 0;
    if (
      typeof(T).GetProperties().Where(p => p.Name == "Id").FirstOrDefault()?.GetValue(entity)
      is long key
    )
    {
      id = key;
    }
    log.Write(
      http.HttpContext?.User?.Identity?.Name,
      JsonSerializer.Serialize(entity),
      entity.GetType().ToString(),
      id,
      action
    );
  }
}
