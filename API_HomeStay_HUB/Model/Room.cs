using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.Model
{
    [Table("Rooms")]
    public class Room
    {
        [Key]
        [Column("roomId")]
        public int? RoomId { get; set; }

        [Column("homestayId")]
        public int HomestayId { get; set; }

        [Column("roomName")]
        public string RoomName { get; set; }

        [Column("roomType")]
        public string RoomType { get; set; }

        [Column("roomSize")]
        public double? RoomSize { get; set; }

        [Column("maxAdults")]
        public int MaxAdults { get; set; }

        [Column("maxChildren")]
        public int? MaxChildren { get; set; }

        [Column("maxBaby")]
        public int? MaxBaby { get; set; }

        [Column("bathroomCount")]
        public int? BathroomCount { get; set; }

        [Column("bedCount")]
        public int? BedCount { get; set; }

        [Column("pricePerNight")]
        public double PricePerNight { get; set; }

        [Column("priceFromSecondNight")]
        public double PriceFromSecondNight { get; set; }

        [Column("extraFeePerChild")]
        public double? ExtraFeePerChild { get; set; }

        [Column("extraFeePerAdult")]
        public double? ExtraFeePerAdult { get; set; }

        [Column("extraFeePerBaby")]
        public double? ExtraFeePerBaby { get; set; }

        [Column("description")]
        public string? Description { get; set; }

        [Column("hasBalcony")]
        public bool? HasBalcony { get; set; }

        [Column("hasTv")]
        public bool? HasTv { get; set; }

        [Column("hasAirConditioner")]
        public bool? HasAirConditioner { get; set; }

        [Column("hasRefrigerator")]
        public bool? HasRefrigerator { get; set; }

        [Column("hasWifi")]
        public bool? HasWifi { get; set; }

        [Column("hasHotWater")]
        public bool? HasHotWater { get; set; }

        [Column("roomImage")]
        public string? RoomImage { get; set; }

        [Column("status")]
        public int? Status { get; set; }

        [Column("createdAt")]
        public DateTime? CreatedAt { get; set; }

        [Column("updatedAt")]
        public DateTime? UpdatedAt { get; set; }
        //public HomeStay? HomeStay { get; set; }  // navigation property

    }
}
