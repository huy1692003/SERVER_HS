namespace API_HomeStay_HUB.DTOs
{
    public class YearDateHideForRoomDTO
    {
        public int year { get; set; }
        public List<MonthsDTO> months { get; set; }
    }

    public class MonthsDTO
    {
        public int month { get; set; }
        public List<int> hiddenDays { get; set; }
    }

}
