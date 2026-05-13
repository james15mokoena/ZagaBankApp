using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Banking_App_API.Data;
using Microsoft.EntityFrameworkCore;

namespace Banking_App_API.Models;

[EntityTypeConfiguration(typeof(ClientConfiguration))]
[Table("Client")]
public class Client
{
    public required string Id { get; set; }

    public required string FirstName { get; set; }

    public string? MiddleName { get; set; }

    public required string LastName { get; set; }

    public required DateTime DOB { get; set; }

    public required char Gender { get; set; }

    public required string Nationality { get; set; }

    public required string PhoneNo { get; set; }

    public required string Email { get; set; }

    public string? MobileAppPassword { get; set; }

    // navigation properties

    public ICollection<AccountHolder> AccountsAndCards { get; } = [];

    public ICollection<ClientAddress> PhysicalAddresses { get; } = [];
}