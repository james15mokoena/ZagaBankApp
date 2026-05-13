using Banking_App_API.Data;
using Banking_App_API.Models.DTO;
using Banking_App_API.Services;

namespace Banking_App_API.Repository;

public class CardRepo(BankAppDbContext context)
{
    private readonly BankAppDbContext _context = context;

    public List<CardDto>? GetCardsByEmail(string? email)
    {
        if (ValidationService.AllValid(email))
        {
            var query =
                from card in _context.Cards
                from client in _context.Clients
                where client.Email == email
                from account in _context.Accounts
                from accountHolder in _context.AccountHolders
                where card.CardNo == accountHolder.CardNo && client.Id == accountHolder.ClientId &&
                    account.AccNo == accountHolder.AccNo
                select new
                {
                    card.CardNo,
                    card.Type,
                    card.Status
                };

            if (query.Any())
            {
                List<CardDto> cards = [];

                foreach (var res in query)
                {
                    cards.Add(new()
                    {
                        CardNo = res.CardNo,
                        Type = res.Type,
                        Status = res.Status
                    });
                }

                return cards;
            }
        }

        return null;
    }
}