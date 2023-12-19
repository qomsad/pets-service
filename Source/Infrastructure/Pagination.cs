namespace PetsService.Infrastructure;

public class Pagination<T>
{
  public IEnumerable<T> Data { get; set; } = [];
  public int Total { get; set; }
}
