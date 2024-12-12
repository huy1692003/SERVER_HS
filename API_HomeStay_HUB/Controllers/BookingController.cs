using System;
using System.Data;
using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.DTOs;
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


        [HttpPost("getBooking")]
        public async Task<IActionResult> getBookingByOwner_Pending([FromQuery] string idOwner, [FromQuery] int status, [FromBody] SearchBookingDTO req)
        {
            DateTime dateStartSearch = new DateTime();
            DateTime dateEndSearch = new DateTime();
            if (req.StartDate != null || req.EndDate != null)
            {
                dateStartSearch = Convert.ToDateTime(req.StartDate);
                dateEndSearch = Convert.ToDateTime(req.EndDate);
            }
            try
            {
                refeshStatusBookingProcess();

                List<Booking> data = new List<Booking>();

                data = await _dbContext.Bookings.Where(
                    b => (status == 10 || b.status == status) && b.OwnerID == idOwner
                    && (string.IsNullOrEmpty(req.Name) || b.Name!.Contains(req.Name))
                    && (string.IsNullOrEmpty(req.Phone) || b.Phone!.Contains(req.Phone))
                    && (string.IsNullOrEmpty(req.Email) || b.Email!.Contains(req.Email))
                    && (req.StartDate == null || b.CheckInDate.Date == dateStartSearch.Date)
                    && (req.EndDate == null || b.CheckOutDate.Date == dateEndSearch.Date)
                    )
                    .OrderByDescending(s => s.BookingTime).ToListAsync();

                if (data.Count > 0)
                {
                    foreach (var book in data)
                    {
                        book.bookingProcess = _dbContext.BookingProcesses.FirstOrDefault(s => s.BookingID == book.BookingID);
                    }
                }
                return Ok(data);
            }
            catch (Exception ex)
            {
                return Ok(new List<Booking>());
            }
        }


        [HttpGet("getBookingDateExisted")]
        public async Task<IActionResult> getBookingDates(int idHomeStay)
        {
            refeshStatusBookingProcess();

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
            refeshStatusBookingProcess();

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



        [HttpGet("getBooking_byCusID")]
        public async Task<IActionResult> GetBooking(string cusID, int status = 1)
        {
            refeshStatusBookingProcess();

            var listBookinh = await _dbContext.Bookings.Where(s => s.CustomerID == cusID && (status == 10 || s.status == status)).OrderByDescending(s => s.BookingTime).ToListAsync();
            if (listBookinh.Count > 0)
            {
                foreach (var book in listBookinh)
                {
                    book.bookingProcess = _dbContext.BookingProcesses.FirstOrDefault(s => s.BookingID == book.BookingID);
                }
            }
            return Ok(listBookinh);
        }

        [HttpGet("confirmCheckIn")]
        public IActionResult ConfirmCheckIn(int bookingID)
        {
            var bookingPrs = _dbContext.BookingProcesses.FirstOrDefault(s => s.BookingID == bookingID);
            var booking = _dbContext.Bookings.FirstOrDefault(s => s.BookingID == bookingID);
            if (bookingPrs != null && booking != null)
            {
                bookingPrs.CheckInTime = DateTime.Now;
                bookingPrs.StepOrder = 3;
                booking.status = 5;
                _dbContext.SaveChanges();
            }
            return Ok();
        }

        [HttpGet("confirmCheckOut")]
        public IActionResult ConfirmCheckOut(int bookingID)
        {
            var bookingPrs = _dbContext.BookingProcesses.FirstOrDefault(s => s.BookingID == bookingID);
            var booking = _dbContext.Bookings.FirstOrDefault(s => s.BookingID == bookingID);
            if (bookingPrs != null && booking != null)
            {
                bookingPrs.CheckOutTime = DateTime.Now;
                bookingPrs.StepOrder = 4;
                booking.IsSuccess = 1;
                booking.status = 6; //hoàn thành
                _dbContext.SaveChanges();
            }
            return Ok();
        }

        private void refeshStatusBookingProcess()
        {
            var datenow = DateTime.Now.Date;
            var listBookinh = (from bk in _dbContext.Bookings
                               join prs in _dbContext.BookingProcesses
                               on bk.BookingID equals prs.BookingID
                               where datenow >= bk.CheckInDate.Date && datenow < bk.CheckOutDate.Date
                               && bk.status == 3
                               select new { prs, bk }).ToList();
            if (listBookinh.Count > 0)
            {

                foreach (var book in listBookinh)
                {
                    book.bk.status = 4;
                }
            }
            _dbContext.SaveChanges();

        }
    }
}
