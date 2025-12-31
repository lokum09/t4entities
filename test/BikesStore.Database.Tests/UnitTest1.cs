using Microsoft.EntityFrameworkCore;

namespace BikesStore.Database.Tests;

public class UnitTest1
{
    [Fact]
    public void Test1()
    {
        Assert.Equal(1, 1);
    }

    [Fact]
    public async Task Should_Add_Two_Numbers()
    {
        using var ctx = new MyDbContext();
        ctx.Database.EnsureCreated();

        var ccc = ctx.ScalarFunctions.dbo;
        string value = ctx.ScalarFunctions.dbo.GetHello();

        Assert.Equal("Hello world!", value);
    }
}
