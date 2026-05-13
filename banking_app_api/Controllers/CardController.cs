using Banking_App_API.Models.DTO;
using Banking_App_API.Services;
using Microsoft.AspNetCore.Mvc;

namespace Banking_App_API.Controllers;

[ApiController]
[Route("api/[controller]/[action]")]
public class CardController(CardService service) : ControllerBase
{
    private readonly CardService _cardService = service;

    [HttpGet("{email}")]
    public IActionResult ViewCardsByEmail(string? email) =>
        ValidationService.AllValid(email) && _cardService.GetCardsByEmail(email) is List<CardDto> cards ?
        Ok(cards) : BadRequest("Failed to get cards.");

    [HttpGet("{email}/{cardNo}")]
    public IActionResult ViewCardDetailsByEmailAndCardNo(string? email, string? cardNo) =>
        ValidationService.AllValid(email, cardNo) &&
        _cardService.GetCardDetailsByEmailAndCardNo(email, cardNo) is CardDto card ?
        Ok(card) : BadRequest("Failed to get card details.");
}