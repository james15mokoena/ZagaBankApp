namespace Banking_App_API.Models.DTO;

public class ResetCardPinDto
{
    public string? Email { get; set; }
    
    public string? CardNo { get; set; }
    
    public string? OldPin { get; set; }
    
    public string? NewPin{ get; set; }
}