using Banking_App_API.Controllers;
using Banking_App_API.Data;
using Banking_App_API.Repository;
using Banking_App_API.Services;
using Microsoft.EntityFrameworkCore;

// load environment variables
DotNetEnv.Env.Load();

var builder = WebApplication.CreateBuilder(args);

// database configuration

var dbHost = builder.Configuration["DBHOST_BANK_APP"];
var dbPort = builder.Configuration["DBPORT_BANK_APP"];
var dbUser = builder.Configuration["DBUSER_BANK_APP"];
var dbPassword = builder.Configuration["DBPASSWORD_BANK_APP"];

if (!string.IsNullOrEmpty(dbHost) && !string.IsNullOrEmpty(dbPort) && !string.IsNullOrEmpty(dbPassword) &&
    !string.IsNullOrEmpty(dbUser))
{
    string connection = $"server={dbHost};user={dbUser};password={dbPassword};port={dbPort};database=zagabankdb";

    builder.Services.AddControllers();
    builder.Services.AddOpenApi();
    builder.Services.AddDbContext<BankAppDbContext>(option =>
    option.UseMySql(connection, ServerVersion.AutoDetect(connection)));

    builder.Services.AddScoped<LoginRepo>();
    builder.Services.AddScoped<LoginService>();
    builder.Services.AddScoped<LoginController>();
    builder.Services.AddScoped<CardRepo>();
    builder.Services.AddScoped<CardService>();
    builder.Services.AddScoped<CardController>();

    var app = builder.Build();

    // Configure the HTTP request pipeline.
    if (app.Environment.IsDevelopment())
    {
        app.MapOpenApi();
    }

    app.UseHttpsRedirection();

    app.MapControllers();

    app.Run();

}
else
    throw new InvalidOperationException("Failed to connect to ZagaBank database");