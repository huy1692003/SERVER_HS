using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.Model
{
    [Table("HomeStays")]
    public class HomeStay
    {
        [Key]
        [Column("homestayID")]
        public int? HomestayID { get; set; }

        [Required]
        [Column("ownerID")]
        public string OwnerID { get; set; }

        [Required]
        [Column("homestayName")]
        public string HomestayName { get; set; }

        [Required]
        [Column("country")]
        public string Country { get; set; }

        [Column("province")]
        public string? Province { get; set; }

        [Column("district")]
        public string? District { get; set; }

        [Column("wardOrCommune")]
        public string? WardOrCommune { get; set; }

        [Required]
        [Column("addressDetail")]
        public string AddressDetail { get; set; }

        [Column("imageHomestay")]
        public string? ImageHomestay { get; set; }

        [Column("linkGoogleMap")]
        public string? LinkGoogleMap { get; set; }

        [Column("timeCheckIn")]
        public string? TimeCheckIn { get; set; }

        [Column("timeCheckOut")]
        public string? TimeCheckOut { get; set; }

        [Column("totalScore")]
        public double? TotalScore { get; set; }

        [Column("viewCount")]
        public int? ViewCount { get; set; }

        [Column("reviewCount")]
        public int? ReviewCount { get; set; }

        [Column("averageRating")]
        public double? AverageRating { get; set; }

        [Column("statusHomestay")]
        public int? StatusHomestay { get; set; }

        [Column("isLocked")]
        public bool? IsLocked { get; set; } = false;
        [Column("isDeleted")]
        public bool? IsDeleted { get; set; } = false;

        [Column("createdAt")]
        public DateTime? CreatedAt { get; set; }

        [Column("updatedAt")]
        public DateTime? UpdatedAt { get; set; }

        //public List<Room>? Rooms { get; set; }
        [NotMapped]
        public List<string> listImage { get; set; } = new List<string>();

    }
}
