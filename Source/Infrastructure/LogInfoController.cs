namespace PetsService.Infrastructure;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PetsService.Security;
using Sieve.Models;

[Route("log"), ApiController, Authorize]
public class LogInfoController(LogInfoService service, PermissionService permission)
  : ControllerBase
{
  [HttpGet]
  public IActionResult GetList([FromQuery] SieveModel param)
  {
    var user = permission.GetUser(this.User.Identity);
    if (user is not null && user.Role.Id != 3)
    {
      return this.NoPermissions();
    }
    return this.Ok(service.GetList(param));
  }

  [HttpDelete("{id}")]
  public IActionResult Delete(long id)
  {
    var user = permission.GetUser(this.User.Identity);
    if (user is not null && user.Role.Id != 3)
    {
      return this.NoPermissions();
    }
    service.Delete(id);
    return this.Ok();
  }
}
