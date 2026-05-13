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

    public CardDto? GetCardDetailsByEmailAndCardNo(string? email, string? cardNo)
    {
        if (ValidationService.AllValid(email, cardNo))
        {
            var query =
                from card in _context.Cards
                where card.CardNo == cardNo
                from client in _context.Clients
                where client.Email == email
                from accountHolder in _context.AccountHolders
                where accountHolder.CardNo == card.CardNo && accountHolder.ClientId == client.Id
                select card;

            if (query.Any())
            {
                return new()
                {
                    CardNo = query.First().CardNo,
                    CVV = query.First().CVV,
                    ExpiryDate = query.First().ExpiryDate,
                    IssuingBank = query.First().IssuingBank,
                    NetworkProvider = query.First().NetworkProvider,
                    Pin = query.First().Pin,
                    Status = query.First().Status,
                    Type = query.First().Type
                };
            }
        }
        
        return null;
    }
}