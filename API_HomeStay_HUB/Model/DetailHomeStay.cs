using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.Model
{
    [Table("DetailHomeStays")]
    public class DetailHomeStay
    {
        [Key]
        [Column("id")] // Thêm ID mới cho DetailHomeStay
        public int? ID { get; set; }

        [ForeignKey("HomeStay")]
        [Column("homestayID")]
        public int? HomestayID { get; set; }

        [Column("numberOfBedrooms")]
        public int? NumberOfBedrooms { get; set; }

        [Column("numberOfLivingRooms")]
        public int? NumberOfLivingRooms { get; set; }

        [Column("numberOfBathrooms")]
        public int? NumberOfBathrooms { get; set; }

        [Column("numberOfKitchens")]
        public int? NumberOfKitchens { get; set; }

        [Column("note")]
        public string? Note { get; set; } 

        [Column("rules")]
        public string? Rules { get; set; }

        [Column("utilities")]
        public string? Utilities { get; set; }

        [Column("regulation")]
        public string? Regulation { get; set; }

        // Navigation property liên kết ngược về bảng HomeStay
        //public virtual HomeStay? HomeStay { get; set; }
    }
}
