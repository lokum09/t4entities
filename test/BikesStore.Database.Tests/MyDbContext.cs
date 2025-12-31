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

    public virtual DbSet<Status> Statuses { get; set; }

    public virtual DbSet<SystemAction> SystemActions { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Status>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_abc.Statuses");
        });

        modelBuilder.Entity<SystemAction>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_xyz.SystemActions");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
