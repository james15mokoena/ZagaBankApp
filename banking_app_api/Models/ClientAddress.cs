using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Banking_App_API.Data;
using Microsoft.EntityFrameworkCore;

namespace Banking_App_API.Models;

[EntityTypeConfiguration(typeof(ClientAddressConfiguration))]
[Table("ClientAddress")]
public class ClientAddress
{
    public required string ClientId { get; set; }

    public required int AddressId { get; set; }

    // navigation property
    public Client Client { get; set; } = null!;

    public PhysicalAddress PhysicalAddress { get; set; } = null!;
}