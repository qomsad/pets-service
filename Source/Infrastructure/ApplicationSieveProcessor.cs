namespace PetsService.Infrastructure;

using Microsoft.Extensions.Options;
using Sieve.Models;
using Sieve.Services;

public class ApplicationSieveProcessor(IOptions<SieveOptions> options) : SieveProcessor(options)
{
  protected override SievePropertyMapper MapProperties(SievePropertyMapper mapper)
  {
    return mapper;
  }
}
