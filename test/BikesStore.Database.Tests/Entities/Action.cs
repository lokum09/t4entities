using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace BikesStore.Database.Tests.Entities;

[Table("Actions", Schema = "xyz")]
public partial class Action
{
    [Key]
    public byte Id { get; set; }

    [StringLength(100)]
    public string Name { get; set; } = null!;
}
