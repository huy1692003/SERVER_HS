namespace API_HomeStay_HUB.Helpers
{
    public class TimeHelper
    {
        public static DateTime GetDateTimeVietnam()
        {
            return TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.UtcNow, "SE Asia Standard Time");
        }
    }
}
