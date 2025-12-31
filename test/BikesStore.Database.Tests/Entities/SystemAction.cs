using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace BikesStore.Database.Tests.Entities;

[Table("SystemActions", Schema = "xyz")]
public partial class SystemAction
{
    [Key]
    public byte Id { get; set; }

    [StringLength(100)]
    public string Name { get; set; } = null!;
}
