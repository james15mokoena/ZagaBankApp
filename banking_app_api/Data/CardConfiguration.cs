using Banking_App_API.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Banking_App_API.Data;

public class CardConfiguration : IEntityTypeConfiguration<Card>
{
    public void Configure(EntityTypeBuilder<Card> builder)
    {
        builder.HasKey(c => c.CardNo);

        builder
            .Property(c => c.CardNo)
            .IsRequired()
            .HasMaxLength(20);

        builder
            .Property(c => c.CVV)
            .IsRequired();

        builder
            .Property(c => c.Type)
            .IsRequired()
            .HasMaxLength(20);

        builder
            .Property(c => c.Status)
            .IsRequired()
            .HasMaxLength(20);

        builder
            .Property(c => c.Pin)
            .IsRequired();

        builder
            .Property(c => c.IssuingBank)
            .IsRequired()
            .HasMaxLength(100);

        builder
            .Property(c => c.NetworkProvider)
            .IsRequired()
            .HasMaxLength(100);

        builder
            .Property(c => c.ExpiryDate)
            .IsRequired();
    }
}