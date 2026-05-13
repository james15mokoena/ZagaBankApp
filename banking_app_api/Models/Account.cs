using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Banking_App_API.Data;
using Microsoft.EntityFrameworkCore;

namespace Banking_App_API.Models;

[EntityTypeConfiguration(typeof(AccountConfiguration))]
[Table("Account")]
public class Account
{
    public required string AccNo { get; set; }

    public required string Type { get; set; }

    public required string BranchCode { get; set; }

    public required string Status { get; set; }

    // navigation properties

    public ICollection<AccountHolder> ClientsAndCards { get; set; } = [];
}