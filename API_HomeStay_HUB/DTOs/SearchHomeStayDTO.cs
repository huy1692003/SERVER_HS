using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.DTOs
{
    public class SearchHomeStayDTO
    {
        public string? Location { get; set; } = "";
        public string? PriceRange { get; set; } = "";
        public string? Name { get; set; } = "";
        public int? NumberOfBedrooms { get; set; }
        public int? NumberOfLivingRooms { get; set; }
        public HashSet<int>? Amenties { get; set; }
        public int? NumberOfBathrooms { get; set; }
        public int? NumberOfKitchens { get; set; }
        public int? NumberofGuest { get; set; }
        public DateTime? DateIn { get; set; }
        public DateTime? DateOut { get; set; }
    }
}
