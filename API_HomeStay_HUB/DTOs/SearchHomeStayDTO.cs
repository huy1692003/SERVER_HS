namespace API_HomeStay_HUB.DTOs
{
    public class SearchHomeStayDTO
    {
        public string? Location { get; set; } = "";
        public int? NumberofGuest { get; set; } = 1;
        public DateTime? DateIn { get; set; }=DateTime.Now;
        public DateTime? DateOut { get; set; } = DateTime.Now.AddDays(1);
    }
}
