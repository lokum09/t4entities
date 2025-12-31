using Microsoft.EntityFrameworkCore;

namespace BikesStore.Database.Tests;

public partial class MyDbContext : DbContext
{
    //public MyDbContext()
    //    : base() { }

    // protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    // {
    //     optionsBuilder.UseSqlServer("Server=db;Database=samples;User=sa;Password=pass!word@123;TrustServerCertificate=True");
    // }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder)
    {
        OnScalarFunctionsCreatingPartial(modelBuilder);
        OnTableFunctionsCreatingPartial(modelBuilder);
    }

}