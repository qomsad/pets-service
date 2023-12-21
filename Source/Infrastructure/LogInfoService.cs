namespace PetsService.Infrastructure;

public class LogInfoService(DatabaseContext context)
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
}
