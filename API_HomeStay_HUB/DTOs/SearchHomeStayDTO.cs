using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.DTOs
{
    public class SearchHomeStayDTO
    {
        public string? Location { get; set; } = "";
        public string? PriceRange { get; set; } = "";
        public string? Name { get; set; } = "";
        public int numberAdult { get; set; }
        public int numberChild { get; set; }
        public int numberBaby { get; set; }
        public HashSet<int>? Amenties { get; set; }
        
        public DateTime? DateIn { get; set; }
        public DateTime? DateOut { get; set; }
    }
}
