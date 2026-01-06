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
    public async Task Should_Say_HelloWorld()
    {
        string value = context.ScalarFunctions.dbo.GetHello("a", "b");

        Assert.Equal("a b", value);
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

    [Fact]
    public async Task Check_GetActions_Function()
    {
        IQueryable<MyDbContext.TableOutputTypes.xyz.GetActions_Result> items = context.TableFunctions.xyz.GetActions();

        Assert.Equal(3, items.Count());
    }
}
