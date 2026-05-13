using Banking_App_API.Models.DTO;
using Banking_App_API.Repository;

namespace Banking_App_API.Services;

public class CardService(CardRepo repo)
{
    private readonly CardRepo _cardRepo = repo;

    public List<CardDto>? GetCardsByEmail(string? email) =>
        ValidationService.AllValid(email) && _cardRepo.GetCardsByEmail(email) is List<CardDto> cards ?
        cards : null;
}