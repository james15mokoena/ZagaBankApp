namespace Banking_App_API.Models.DTO;

public class CardDto
{
    public string? CardNo { get; set; } = "";

    public string Status { get; set; } = "";

    public string? Type { get; set; } = "";

    public int Pin { get; set; }

    public string? NetworkProvider { get; set; } = "";

    public string? IssuingBank { get; set; } = "";

    public DateTime? ExpiryDate { get; set; }

    public int CVV { get; set; }
}