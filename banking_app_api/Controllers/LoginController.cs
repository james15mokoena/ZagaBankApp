using Banking_App_API.Models.DTO;
using Banking_App_API.Services;
using Microsoft.AspNetCore.Mvc;

namespace Banking_App_API.Controllers;

[ApiController]
[Route("api/[controller]/[action]")]
public class LoginController(LoginService service) : ControllerBase
{
    private readonly LoginService _loginService = service;

    [HttpPost]
    public IActionResult Login(LoginDto login) =>
        !string.IsNullOrEmpty(login.Email) && !string.IsNullOrEmpty(login.Password) &&
            _loginService.Login(login.Email, login.Password) ?
        Ok(true) : BadRequest("Login failed.");
}