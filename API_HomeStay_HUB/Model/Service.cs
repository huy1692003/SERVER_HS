using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.Model
{
    [Table("Homestay_Services")]
    public class Service
    {
        [Key]
        [Column("serviceID")]
        public int? ServiceID { get; set; }

        [Required]
        [Column("ownerID")]
        public string OwnerID { get; set; }

        [Required]
        [Column("serviceName")]
        public string ServiceName { get; set; }

        [Column("description")]
        public string? Description { get; set; }

        [Column("imagePreview")]
        public string? ImagePreview { get; set; }

        [Required]
        [Column("price")]
        public decimal Price { get; set; }

        [Required]
        [Column("unit")]
        public string Unit { get; set; }

        [Column("isActive")]
        public bool? IsActive { get; set; } = true;

        [Column("createdAt")]
        public DateTime? CreatedAt { get; set; } = DateTime.Now;

        [Column("updatedAt")]
        public DateTime? UpdatedAt { get; set; } = DateTime.Now;

        
    }
}
