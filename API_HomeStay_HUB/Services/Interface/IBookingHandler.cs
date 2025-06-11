using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.Services.Interface
{
    public interface IBookingHandler
    {
        Task ProcessBookingAsync(Booking booking);
    }
}
