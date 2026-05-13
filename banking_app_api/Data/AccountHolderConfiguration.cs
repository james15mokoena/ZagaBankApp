using Banking_App_API.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Banking_App_API.Data;

public class AccountHolderConfiguration : IEntityTypeConfiguration<AccountHolder>
{
    public void Configure(EntityTypeBuilder<AccountHolder> builder)
    {
        builder.
            HasKey(a => new
            {
                a.ClientId,
                a.AccNo,
                a.CardNo
            });

        builder
            .Property(a => a.ClientId)
            .IsRequired();

        builder
            .Property(a => a.AccNo)
            .IsRequired();

        builder
            .Property(a => a.CardNo)
            .IsRequired();

        builder
            .Property(a => a.LastAccessDate)
            .IsRequired(false);

        builder
            .Property(a => a.LastDepositDate)
            .IsRequired(false);
        
        builder
            .Property(a => a.LastWithdrawalDate)
            .IsRequired(false);

        // foreign keys
        builder
            .HasOne(a => a.Client)
            .WithMany(c => c.AccountsAndCards)
            .HasForeignKey(a => a.ClientId);

        builder
            .HasOne(ah => ah.Account)
            .WithMany(ac => ac.ClientsAndCards)
            .HasForeignKey(ah => ah.AccNo);

        builder
            .HasOne(ah => ah.Card)
            .WithMany(c => c.ClientsAndAccounts)
            .HasForeignKey(ah => ah.CardNo);
    }
}