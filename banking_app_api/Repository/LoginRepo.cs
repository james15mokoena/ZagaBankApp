using Banking_App_API.Data;

namespace Banking_App_API.Repository;

public class LoginRepo(BankAppDbContext context)
{
    private readonly BankAppDbContext _context = context;

    public bool Login(string email, string password)
    {
        var query =
            from client in _context.Clients
            where client.Email == email && client.MobileAppPassword == password
            select client;

        if (query.Any())
            return true;

        return false;
    }
}