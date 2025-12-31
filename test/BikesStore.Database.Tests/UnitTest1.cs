using Microsoft.EntityFrameworkCore;
using Xunit;

namespace BikesStore.Database.Tests;

public class UnitTest1 : IClassFixture<DbContextFixture>
{
    private readonly MyDbContext context;

    public UnitTest1(DbContextFixture fixture)
    {
        context = fixture.Context;
    }

    [Fact]
    public void Test1()
    {
        Assert.Equal(1, 1);
    }

    [Fact]
    public async Task Should_Say_HelloWorld()
    {
        //using var ctx = new MyDbContext();
        

        string value = context.ScalarFunctions.dbo.GetHello();

        Assert.Equal("Hello world!", value);
    }

    [Fact]
    public async Task Should_Say_Hello()
    {
        string value = context.ScalarFunctions.abc.GetHello2("John");

        Assert.Equal("Hello John!", value);
    }

    [Fact]
    public async Task Check_Table_Function()
    {
        MyDbContext.TableOutputTypes.xyz.GetMainActions_Result item = context.TableFunctions.xyz.GetMainActions(2).First();

        Assert.Equal(1, item.Id);
        Assert.Equal("Initialization", item.Name);
    }
}
