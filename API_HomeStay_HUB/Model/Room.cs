namespace API_HomeStay_HUB.Model
{
    public class Room
    {
        public int RoomId { get; set; }
        public int HomestayId { get; set; }
        public string RoomName { get; set; }
        public string RoomType { get; set; }
        public decimal? RoomSize { get; set; }
        public int MaxAdults { get; set; } = 0;
        public int? MaxChildren { get; set; } = 0;
        public int? BathroomCount { get; set; } = 0;
        public int? BedCount { get; set; } = 0;
        public double PricePerNight { get; set; } = 0;
        public double? ExtraFeePerChild { get; set; } = 0;
        public double? ExtraFeePerAdult { get; set; } = 0;
        public string? Description { get; set; }
        public bool? HasBalcony { get; set; } = false;
        public bool? HasTv { get; set; } = false;
        public bool? HasAirConditioner { get; set; } = true;
        public bool? HasRefrigerator { get; set; } = false;
        public bool? HasWifi { get; set; } = true;
        public bool? HasHotWater { get; set; } = true;
        public string? RoomImage { get; set; }
        public int? Status { get; set; }
        public DateTime? CreatedAt { get; set; } = DateTime.Now;
        public DateTime? UpdatedAt { get; set; } = DateTime.Now;

        // Navigation property
        public virtual HomeStay HomeStay { get; set; }
    }
}
