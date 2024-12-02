using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Repositories
{
    public class BookingRepository : IBookingRepository
    {
        private readonly DBContext _dbContext;
        public BookingRepository(DBContext dBContext)
        {
            _dbContext = dBContext;
        }
        private int GenerateRandomId()
        {
            DateTime now = DateTime.Now;
            // Lấy mili giây từ thời gian hiện tại và chuyển đổi nó thành số nguyên
            return (int)(now.Ticks % int.MaxValue); // Sử dụng modulo để đảm bảo trong giới hạn int
        }
        public async Task<bool> createBooking(Booking booking)
        {
            booking.BookingID = GenerateRandomId();
            if (!await checkDateExitedBooking(booking.HomeStayID!, booking.CheckInDate!, booking.CheckOutDate!))
            {
                await _dbContext.AddAsync(booking);
                return await _dbContext.SaveChangesAsync() > 0;
            }
            else
            {
                return false;
            }
        }

        public async Task<IEnumerable<dynamic>> getBookingDates(int idHomeStay)
        {
            return await _dbContext.Bookings.
                Where(b => b.HomeStayID == idHomeStay ).
                Select(b => new { b.CheckInDate, b.CheckOutDate }).ToListAsync();
        }

        public async Task<bool> confirmBooking(int idBooking)
        {
            var booking = await _dbContext.Bookings.FirstOrDefaultAsync(s => s.BookingID == idBooking);
            if (booking != null)
            {
                booking.IsConfirm = 1;
                await _dbContext.BookingProcesses.AddAsync
                    (
                        new BookingProcess
                        {
                            BookingID = idBooking,

                            StepOrder = 1,
                            
                        }
                    );
                return await _dbContext.SaveChangesAsync() > 0;
            }
            return false;

        }
        public async Task<bool> cancelBooking(int idBooking, string reasonCancel)
        {
            var booking = await _dbContext.Bookings.FirstOrDefaultAsync(s => s.BookingID == idBooking);
            if (booking != null)
            {
                booking.IsCancel = 1;
                booking.ReasonCancel = reasonCancel;
                return await _dbContext.SaveChangesAsync() > 0;
            }
            return false;
        }
        public async Task<bool> checkDateExitedBooking(int? idHomestay, DateTime? dateIn, DateTime? dateOut)
        {
            var bookingByHomeStays = await _dbContext.Bookings
                .Where(bk => bk.HomeStayID == idHomestay  &&
                             dateIn < bk.CheckOutDate && dateOut > bk.CheckInDate)
                .ToListAsync();

            return bookingByHomeStays.Any();
        }


    }
}
