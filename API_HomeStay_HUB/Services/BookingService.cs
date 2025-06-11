using System.Text;
using API_HomeStay_HUB.Helpers;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Realtime;
using API_HomeStay_HUB.Repositories;
using API_HomeStay_HUB.Repositories.Intefaces;
using API_HomeStay_HUB.Repositories.Interfaces;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.SignalR;

namespace API_HomeStay_HUB.Services
{
    public class BookingService : IBookingService
    {
        private readonly IBookingRepository _bookingRepository;
        

        public BookingService(IBookingRepository bookingRepository, ISendMaillService sendM, IHubContext<MyHub> _hub, INotificationRepository no, IUserRepository userRepository, IHomeStayRepository homeStayRepository)
        {
            this._bookingRepository = bookingRepository;
          
        }

       
       
        public async Task<bool> confirmBooking(int idBooking)
        {
            return await _bookingRepository.confirmBooking(idBooking);
        }
        public async Task<bool> cancelBooking(int idBooking, string reasonCancel)
        {
            return await _bookingRepository.cancelBooking(idBooking, reasonCancel);
        }


      


    }
}
