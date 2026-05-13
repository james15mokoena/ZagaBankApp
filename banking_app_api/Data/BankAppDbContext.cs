using Banking_App_API.Models;
using Microsoft.EntityFrameworkCore;

namespace Banking_App_API.Data;

public class BankAppDbContext(DbContextOptions<BankAppDbContext> options) : DbContext(options)
{
    public DbSet<Client> Clients { get; set; }

    public DbSet<Account> Accounts { get; set; }

    public DbSet<Card> Cards { get; set; }
    
    public DbSet<AccountHolder> AccountHolders { get; set; }
    
    public DbSet<PhysicalAddress> PhysicalAddresses { get; set; }

    public DbSet<ClientAddress> ClientAddresses { get; set; }
}