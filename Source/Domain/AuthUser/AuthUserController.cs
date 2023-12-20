namespace PetsService.Domain;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

[Route("user"), ApiController, Authorize]
public class AuthUserController(AuthUserService service) : ControllerBase
{
  [HttpGet]
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
}
