namespace API_HomeStay_HUB.DTOs
{
    public class SearchHomeStayAdminDTO
    {

        public string? Location { get; set; } = "";
        public string? PriceRange { get; set; } = "";
        public string? Name { get; set; } = "";
        public int? NumberOfBedrooms { get; set; }
        public int? NumberOfLivingRooms { get; set; }
        public int? NumberOfBathrooms { get; set; }
        public int? NumberOfKitchens { get; set; }
        public int? NumberofGuest { get; set; }  
        public string? UserName { get; set; }
        public string? FullName { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }

       
    }
}
