using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Banking_App_API.Data;
using Microsoft.EntityFrameworkCore;

namespace Banking_App_API.Models;

[EntityTypeConfiguration(typeof(AccountHolderConfiguration))]
[Table("AccountHolder")]
public class AccountHolder
{
    public required string ClientId { get; set; }

    public required string AccNo { get; set; }

    public required string CardNo { get; set; }

    public DateTime? LastAccessDate { get; set; }

    public DateTime? LastDepositDate { get; set; }

    public DateTime? LastWithdrawalDate { get; set; }

    // reference navigation properties

    public Client Client { get; set; } = null!;

    public Account Account { get; set; } = null!;

    public Card Card { get; set; } = null!;
}