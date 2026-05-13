using Banking_App_API.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Banking_App_API.Data;

public class AccountConfiguration : IEntityTypeConfiguration<Account>
{
    public void Configure(EntityTypeBuilder<Account> builder)
    {
        builder.HasKey(a => a.AccNo);

        builder
            .Property(a => a.AccNo)
            .IsRequired()
            .HasMaxLength(20);

        builder
            .Property(a => a.BranchCode)
            .IsRequired()
            .HasMaxLength(20);

        builder
            .Property(a => a.Status)
            .IsRequired()
            .HasMaxLength(20);
        
        builder
            .Property(a => a.Type)
            .IsRequired()
            .HasMaxLength(20);
    }
}