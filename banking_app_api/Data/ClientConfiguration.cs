using Banking_App_API.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Banking_App_API.Data;

public class ClientConfiguration : IEntityTypeConfiguration<Client>
{
    public void Configure(EntityTypeBuilder<Client> modelBuilder)
    {
        modelBuilder.HasKey(c => c.Id);

        modelBuilder
            .Property(p => p.Id)
            .IsRequired()
            .HasMaxLength(20);

        modelBuilder
            .Property(p => p.FirstName)
            .IsRequired()
            .HasMaxLength(100);
        modelBuilder
            .Property(p => p.MiddleName)
            .HasMaxLength(100);

        modelBuilder
            .Property(p => p.LastName)
            .IsRequired()
            .HasMaxLength(100);

        modelBuilder
            .Property(p => p.Nationality)
            .IsRequired()
            .HasMaxLength(100);

        modelBuilder
            .Property(p => p.PhoneNo)
            .IsRequired()
            .HasMaxLength(15);

        modelBuilder
            .Property(p => p.Email)
            .IsRequired()
            .HasMaxLength(100);

        modelBuilder
            .Property(p => p.MobileAppPassword)
            .IsRequired()
            .HasMaxLength(100);

        modelBuilder
            .Property(p => p.Gender)
            .IsRequired()
            .HasMaxLength(1);
    }
}