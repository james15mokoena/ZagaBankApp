using Banking_App_API.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Banking_App_API.Data;

public class ClientAddressConfiguration : IEntityTypeConfiguration<ClientAddress>
{
    
    public void Configure(EntityTypeBuilder<ClientAddress> builder)
    {
        builder
            .HasKey(ca => new
            {
                ca.ClientId,
                ca.AddressId
            });

        builder
            .HasOne(ca => ca.Client)
            .WithMany(c => c.PhysicalAddresses)
            .HasForeignKey(ca => ca.ClientId);
        
        builder
            .HasOne(ca => ca.PhysicalAddress)
            .WithMany(p => p.ClientAddresses)
            .HasForeignKey(ca => ca.AddressId);
    }
}