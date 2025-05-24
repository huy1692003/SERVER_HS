namespace API_HomeStay_HUB.DTOs
{
    public class SearchHomeStayAdminDTO
    {

        public string? Location { get; set; } = "";
        public string? PriceRange { get; set; } = "";
        public string? Name { get; set; } = "";
        public string? IdHomeStay { get; set; } = "";
        public int? RoomCount { get; set; } = 0;
        public string? AverageRating { get; set; } = "";
        public string? UserName { get; set; }
        public string? FullName { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }

       
    }
}
