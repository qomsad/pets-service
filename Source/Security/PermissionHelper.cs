namespace PetsService.Security;

using Microsoft.AspNetCore.Mvc;

public static class PermissionHelper
{
  public static ObjectResult NoPermissions(this ControllerBase controller) =>
    controller.Problem(null, null, 403, "У вас нет привилегий");
}
