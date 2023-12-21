namespace PetsService.Domain;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PetsService.Security;
using Sieve.Models;

[Route("user"), ApiController, Authorize]
public class AuthUserController(AuthUserService service, PermissionService permission)
  : ControllerBase
{
  [HttpGet("/current")]
  public IActionResult UserInfo()
  {
    var current = this.User.Identity?.Name;
    if (current is null)
    {
      return this.Unauthorized();
    }
    var user = service.GetByLogin(current);
    if (user is null)
    {
      return this.Unauthorized();
    }
    return this.Ok(user);
  }

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
}
