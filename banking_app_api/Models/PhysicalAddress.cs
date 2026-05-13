using System.ComponentModel.DataAnnotations.Schema;
using Banking_App_API.Data;
using Microsoft.EntityFrameworkCore;

namespace Banking_App_API.Models;

[EntityTypeConfiguration(typeof(PhysicalAddressConfiguration))]
[Table("PhysicalAddress")]
public class PhysicalAddress
{
    public required int Id { get; set; }

    public required int StreetNo { get; set; }

    public required string StreetName { get; set; }

    public required string Suburb { get; set; }

    public required string Town { get; set; }

    public required string Province { get; set; }

    public required int PostalCode { get; set; }

    public required string Country { get; set; }

    // navigation property
    public ICollection<ClientAddress> ClientAddresses { get; set; } = [];
}