using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.Model
{
    [Table("Settings")]
    public class Setting
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("id")]
        public int? Id { get; set; }
        [Required]
        [Column("key")]
        public string Key { get; set; }
        [Required]
        [Column("value")]
        public string Value { get; set; }
        [Required]
        [Column("valueType")]
        public string ValueType { get; set; }
        [Column("description")]
        public string? Description { get; set; }
        [Column("isActive")]
        public bool? IsActive { get; set; } = true;
        [Column("createdAt")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        [Column("updatedAt")]
        public DateTime? UpdatedAt { get; set; }
    }
}
