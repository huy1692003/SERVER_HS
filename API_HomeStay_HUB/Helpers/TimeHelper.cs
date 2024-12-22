namespace API_HomeStay_HUB.Helpers
{
    public class TimeHelper
    {
        public static DateTime GetDateTimeVietnam()
        {
            return TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.UtcNow, "SE Asia Standard Time");
        }

        public static string formatDateVN(DateTime? dateTime,string type="time")
        {
            TimeZoneInfo vietnamTimeZone = TimeZoneInfo.FindSystemTimeZoneById("SE Asia Standard Time");
            DateTime vietnamTime = TimeZoneInfo.ConvertTime(dateTime??DateTime.Now, vietnamTimeZone);

            // Trả về thời gian đã được định dạng theo định dạng của Việt Nam
            return vietnamTime.ToString(type=="date"? "dd/MM/yyyy" : "dd/MM/yyyy HH:mm:ss");
        }

    }
}
