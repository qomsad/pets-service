namespace PetsService.Infrastructure;

using Sieve.Models;
using Sieve.Services;

public class LogInfoService(DatabaseContext context, ISieveProcessor sieve)
{
  public void Write(string? user, string entity, string registry, long id, string action)
  {
    var log = new LogInfo
    {
      User = user,
      ActionDate = DateTime.UtcNow,
      Action = action,
      Entity = entity,
      Registry = registry,
      ObjectId = id
    };
    context.LogInfo.Add(log);
    context.SaveChanges();
  }

  public Pagination<LogInfo> GetList(SieveModel param)
  {
    var repository = context.LogInfo;
    var data = sieve.Apply(param, repository);
    var total = sieve.Apply(new SieveModel { Filters = param.Filters }, repository).Count();
    return new Pagination<LogInfo> { Data = data, Total = total };
  }

  public void Delete(long id)
  {
    var entity = context.LogInfo.Find(id);
    if (entity is not null)
    {
      context.LogInfo.Remove(entity);
    }
  }
}
