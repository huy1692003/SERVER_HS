namespace API_HomeStay_HUB.Model
{
    public class DetailBooking
    {
        public int? RoomId { get; set; }
        public string? RoomName { get; set; } = string.Empty;
        public string? RoomType { get; set; } = string.Empty;

        public int? MaxAdults { get; set; }
        public int? MaxChildren { get; set; }
        public int? MaxBaby { get; set; }

        public int? NumberAdults { get; set; }
        public int? NumberChildren { get; set; }
        public int? NumberBaby { get; set; }

        public decimal? PricePerNight { get; set; }
        public decimal? PriceFromSecondNight { get; set; }

        public decimal? ExtraFeePerAdult { get; set; }
        public decimal? ExtraFeePerChild { get; set; }
        public decimal? ExtraFeePerBaby { get; set; }

        public DateTime? DateStart { get; set; }
        public DateTime? DateEnd { get; set; }

        public decimal? TotalPriceRoom { get; set; }
    }
}
