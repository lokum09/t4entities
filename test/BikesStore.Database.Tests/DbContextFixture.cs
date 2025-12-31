using Microsoft.EntityFrameworkCore;
using Xunit;

namespace BikesStore.Database.Tests;

public class DbContextFixture : IDisposable
{
    public MyDbContext Context { get; private set; }

    public DbContextFixture()
    {
        var options = new DbContextOptionsBuilder<MyDbContext>()
            .UseSqlServer("Server=db;Database=samples;User=sa;Password=pass!word@123;TrustServerCertificate=True")
            .Options;

        Context = new MyDbContext(options);

        // Optional: seed initial data
        Context.Database.EnsureCreated();
    }

    public void Dispose()
    {
        Context?.Dispose(); // Clean up
    }
}
