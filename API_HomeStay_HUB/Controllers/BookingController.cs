using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookingController : ControllerBase
    {
        private readonly IBookingService _bookingService;
        private readonly DBContext _dbContext;

        public BookingController(IBookingService bookingService, DBContext dBContext)
        {
            _bookingService = bookingService;
            _dbContext = dBContext;
        }


        [HttpGet("getBooking")]
        public async Task<IActionResult> getBookingByOwner_Pending([FromQuery] string idOwner, [FromQuery] int status)
        {
            List<Booking> data=new List<Booking>();
            if (status == 0) // Chưa xác nhận
            {
                data = await _dbContext.Bookings.Where(b => b.IsConfirm == 0 &&b.IsCancel!=1 && b.OwnerID == idOwner).ToListAsync();
            }
            else if (status == 1) // Đã xác nhận
            {
                data = await _dbContext.Bookings.Where(b => b.IsConfirm == 1 && b.OwnerID == idOwner).ToListAsync();
            }
            else if (status == 3) // Đã hủy
            {
                data = await _dbContext.Bookings.Where(b => b.IsCancel == 1 && b.OwnerID == idOwner).ToListAsync();
            }
            
            else
            {
                return BadRequest("Trạng thái không hợp lệ.");
            }

            return Ok(data);
        }


        [HttpGet("getBookingDateExisted")]
        public async Task<IActionResult> getBookingDates(int idHomeStay)
        {
            return Ok(await _bookingService.getBookingDates(idHomeStay));
        }

        [HttpPost("create")]
        public async Task<IActionResult> CreateBooking([FromBody] Booking booking)
        {
            if (booking == null)
            {
                return BadRequest("Dữ liệu đặt phòng là bắt buộc.");
            }

            var result = await _bookingService.createBooking(booking);
            if (result)
            {
                return Ok("Đặt phòng thành công.");
            }
            return BadRequest("Không thể tạo đặt phòng.");
        }


        [HttpPut("confirm/{idBooking}")]
        public async Task<IActionResult> ConfirmBooking(int idBooking)
        {
            var result = await _bookingService.confirmBooking(idBooking);
            if (result)
            {
                return Ok("Đặt phòng đã được xác nhận thành công.");
            }
            return BadRequest("Không thể xác nhận đặt phòng.");
        }


        [HttpPut("cancel/{idBooking}")]
        public async Task<IActionResult> CancelBooking(int idBooking, [FromQuery] string reasonCancel)
        {
            if (string.IsNullOrEmpty(reasonCancel))
            {
                return BadRequest("Lý do hủy đặt phòng là bắt buộc.");
            }

            var result = await _bookingService.cancelBooking(idBooking, reasonCancel);
            if (result)
            {
                return Ok("Đặt phòng đã được hủy thành công.");
            }
            return BadRequest("Không thể hủy đặt phòng.");
        }

    }
}
