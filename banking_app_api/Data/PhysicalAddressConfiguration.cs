using Banking_App_API.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Banking_App_API.Data;

public class PhysicalAddressConfiguration : IEntityTypeConfiguration<PhysicalAddress>
{
    public void Configure(EntityTypeBuilder<PhysicalAddress> builder)
    {
        builder.HasKey(p => p.Id);

        builder
            .Property(p => p.Id)
            .IsRequired()
            .ValueGeneratedOnAdd();

        builder
            .Property(p => p.StreetNo)
            .IsRequired();

        builder
            .Property(p => p.StreetName)
            .IsRequired()
            .HasMaxLength(100);

        builder
            .Property(p => p.Suburb)
            .IsRequired()
            .HasMaxLength(100);
        
        builder
            .Property(p => p.Town)
            .IsRequired()
            .HasMaxLength(100);

        builder
            .Property(p => p.PostalCode)
            .IsRequired();

        builder
            .Property(p => p.Province)
            .IsRequired()
            .HasMaxLength(100);

        builder
            .Property(p => p.Country)
            .IsRequired()
            .HasMaxLength(100);
    }
}