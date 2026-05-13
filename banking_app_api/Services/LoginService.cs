using Banking_App_API.Repository;

namespace Banking_App_API.Services;

public class LoginService(LoginRepo repo)
{
    private readonly LoginRepo _loginRepo = repo;

    public bool Login(string email, string password) =>
        !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password) && _loginRepo.Login(email, password);
        
}