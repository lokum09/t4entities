using System;
using System.Collections.Generic;
using BikesStore.Database.Tests.Entities;
using Microsoft.EntityFrameworkCore;

namespace BikesStore.Database.Tests;

public partial class MyDbContext : DbContext
{
    public MyDbContext(DbContextOptions<MyDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<BikesStore.Database.Tests.Entities.Action> Actions { get; set; }

    public virtual DbSet<BikesStore.Database.Tests.Entities.Status> Statuses { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<BikesStore.Database.Tests.Entities.Action>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_xyz.Actions");
        });

        modelBuilder.Entity<BikesStore.Database.Tests.Entities.Status>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_abc.Statuses");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
