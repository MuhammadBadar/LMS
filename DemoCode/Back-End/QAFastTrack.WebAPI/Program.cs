using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using NLog;
using Restaurant.Core.Services.Token;
using Restaurant.DAL.Acc;
using Restaurant.Data;
using Restaurant.Models;
using Restaurant.Service.Acc;
using System.Text;

var builder = WebApplication.CreateBuilder (args);
builder.Services.AddControllers ();
builder.Services.AddScoped<IJWTTokenGenerator, JWTTokenGenerator> ();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer ();
builder.Services.AddSwaggerGen ();

ConfigurationManager configuration = builder.Configuration;
//builder.Services.Configure<KestrelServerOptions>(configuration.GetSection("Kestrel"));
var serverVersion = new MySqlServerVersion (new Version (8, 0, 26)); // Get the value from SELECT VERSION()
builder.Services.AddDbContext<ApplicationDbContext> (c => c.UseMySql (configuration.GetConnectionString ("ConnStr"), serverVersion));

LogManager.LoadConfiguration (string.Concat (Directory.GetCurrentDirectory (), "/NLog.config"));
//var logger =NLog.Web.NLogBuilder.ConfigureNLog("NLog.config").GetCurrentClassLogger();
//var  log =LogManager.GetCurrentClassLogger();

#region Register Services 

builder.Services.AddScoped<IAccService, AccService> ();

#endregion
#region Register DAL 

builder.Services.AddScoped<IAccDAL, AccountDAL> ();

#endregion

builder.Services.AddIdentity<User, IdentityRole> (
        options =>
        {
            options.User.RequireUniqueEmail = true;
            options.SignIn.RequireConfirmedAccount = false;
            options.Password.RequiredLength = 4;
            options.Password.RequireLowercase = false;
            options.Password.RequireUppercase = false;
            options.Password.RequireNonAlphanumeric = false;
            options.User.AllowedUserNameCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@._-";
        }
        )
    .AddEntityFrameworkStores<ApplicationDbContext> ();

builder.Services.AddAuthentication (cfg =>
{
    cfg.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    cfg.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer (options =>
{
    options.RequireHttpsMetadata = false;
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey (Encoding.UTF8.GetBytes (configuration["Token:Key"])),
        ValidIssuer = configuration["Token:Issuer"],
        ValidAudience = configuration["Token:Issuer"],
        ValidateIssuer = true,
        ValidateAudience = true,
    };
});

builder.Services.AddAuthorization (options =>
{
    options.AddPolicy ("ManagerOnly", policy =>
    {
        policy.RequireRole ("Manager");
    });

});
var app = builder.Build ();

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment ())
//{
    app.UseSwagger ();
    app.UseSwaggerUI ();
//}
app.UseHsts ();
app.UseHttpsRedirection ();
app.UseDefaultFiles ();
app.UseStaticFiles ();
app.UseCors (x => x

          .AllowAnyOrigin ()
          .AllowAnyMethod ()
          .AllowAnyHeader ());
app.UseHttpsRedirection ();
app.UseAuthentication ();
app.UseAuthorization ();
app.MapControllers ();
app.Run ();
