using System.ComponentModel.DataAnnotations.Schema;
using Banking_App_API.Data;
using Microsoft.EntityFrameworkCore;

namespace Banking_App_API.Models;

[EntityTypeConfiguration(typeof(CardConfiguration))]
[Table("Card")]
public class Card
{
    public required string CardNo { get; set; }

    public required int Pin { get; set; }

    public required string Type { get; set; }

    public required string NetworkProvider { get; set; }

    public required string IssuingBank { get; set; }

    public required DateTime ExpiryDate { get; set; }

    public required string Status { get; set; }

    public required int CVV { get; set; }

    // navigation properties

    public ICollection<AccountHolder> ClientsAndAccounts { get; set; } = [];
}