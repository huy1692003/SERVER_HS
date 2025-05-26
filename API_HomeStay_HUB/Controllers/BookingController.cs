using System;
using System.Data;
using System.Text;
using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Helpers;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services;
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
        public async Task<IActionResult> getBookingByOwner_Pending([FromQuery] string idOwner, [FromQuery] int status, [FromQuery] PaginateDTO paginate, [FromBody] SearchBookingDTO req)
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

                // Xây dựng câu truy vấn tìm kiếm
                var query = _dbContext.Bookings.Where(
                    b => (status == 10 || b.status == status) && b.OwnerID == idOwner
                    && (string.IsNullOrEmpty(req.Name) || b.Name!.Contains(req.Name))
                    && (string.IsNullOrEmpty(req.Phone) || b.Phone!.Contains(req.Phone))
                    && (string.IsNullOrEmpty(req.Email) || b.Email!.Contains(req.Email))
                    && (req.StartDate == null || b.CheckInDate.Date == dateStartSearch.Date)
                    && (req.EndDate == null || b.CheckOutDate.Date == dateEndSearch.Date)
                )
                .OrderByDescending(s => s.BookingTime);

                // Tính toán phân trang
                var totalRecords = await query.CountAsync();  // Lấy tổng số bản ghi
                var bookings = await query
                    .Skip((paginate.Page - 1) * paginate.PageSize)  // Bỏ qua các bản ghi trước trang hiện tại
                    .Take(paginate.PageSize)  // Lấy số lượng phần tử trong trang
                    .ToListAsync();

                // Thêm thông tin bookingProcess vào từng booking
                foreach (var book in bookings)
                {
                    book.bookingProcess = _dbContext.BookingProcesses.FirstOrDefault(s => s.BookingID == book.BookingID);
                }

                return Ok(new
                {
                    TotalRecords = totalRecords,
                    TotalPages = (int)Math.Ceiling((double)totalRecords / paginate.PageSize),  // Tổng số trang
                    CurrentPage = paginate.Page,
                    PageSize = paginate.PageSize,
                    Items = bookings
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }


        [HttpGet("getBookingDateExisted")]
        public async Task<IActionResult> getBookingDates(int idHomeStay, int idRoom)
        {

            return Ok(await _bookingService.getBookingDates(idHomeStay, idRoom));
        }


        [HttpPost("create")]
        public async Task<IActionResult> CreateBooking([FromBody] Booking booking)
        {
            booking.BookingID = GenerateRandomId();
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
        public async Task<IActionResult> GetBooking(string? phoneCus, string? emailCus, string? customerID, int status = 1)
        {
            refeshStatusBookingProcess();
            // export const statusBooking = [
            //{ index: 10, des: "Tất cả đơn",
            //{ index: 1, des: "Đang chờ xác nhận",
            //{ index: 2, des: "Đang chờ thanh toán",
            //{ index: 3, des: "Đang chờ nhận phòng",
            //{ index: 4, des: "Đang chờ CheckIn",
            //{ index: 5, des: "Đang chờ CheckOut", ,
            //{ index: 6, des: "Đã hoàn thành",,
            //{ index: -1, des: "Đã bị hủy",]}
            bool check1 = string.IsNullOrEmpty(phoneCus);
            bool check2 = string.IsNullOrEmpty(emailCus);
            bool check3 = string.IsNullOrEmpty(customerID);

            ICollection<Booking> listBooking = await _dbContext.Bookings
                .Where(s => (status == 10 || s.status == status) &&
                            (string.IsNullOrEmpty(customerID) ?
                                (string.IsNullOrEmpty(phoneCus) || s.Phone == phoneCus) &&
                                (string.IsNullOrEmpty(emailCus) || s.Email == emailCus) :
                                s.CustomerID == customerID))
                .OrderByDescending(s => s.BookingTime)
                .ToListAsync();

            if (listBooking.Count > 0)
            {
                foreach (var book in listBooking)
                {
                    book.bookingProcess = _dbContext.BookingProcesses.FirstOrDefault(s => s.BookingID == book.BookingID);
                    var user = _dbContext.OwnerStays.Join(
                        _dbContext.Users,
                        owner => owner.UserID,
                        user => user.UserID,
                        (owner, user) => new
                        { owner, inforOwner = user }).FirstOrDefault(s => s.owner.OwnerID == book.OwnerID);
                    book.phoneOwner = user.inforOwner.PhoneNumber;
                    book.nameOwner = user.inforOwner.FullName;
                }
            }
            return Ok(listBooking);
        }

        [HttpGet("confirmCheckIn")]
        public IActionResult ConfirmCheckIn(int bookingID)
        {
            var bookingPrs = _dbContext.BookingProcesses.FirstOrDefault(s => s.BookingID == bookingID);
            var booking = _dbContext.Bookings.FirstOrDefault(s => s.BookingID == bookingID);
            if (bookingPrs != null && booking != null)
            {
                bookingPrs.CheckInTime = TimeHelper.GetDateTimeVietnam();
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
                bookingPrs.CheckOutTime = TimeHelper.GetDateTimeVietnam();
                bookingPrs.StepOrder = 4;
                booking.IsSuccess = true;
                booking.status = 6; //hoàn thành

                _dbContext.SaveChanges();
            }
            return Ok();
        }

        private void refeshStatusBookingProcess()
        {
            var datenow = TimeHelper.GetDateTimeVietnam().Date;
            var listBookinh = (from bk in _dbContext.Bookings
                               join prs in _dbContext.BookingProcesses
                               on bk.BookingID equals prs.BookingID
                               where datenow.Date >= bk.CheckInDate.Date && datenow.Date < bk.CheckOutDate.Date
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



        private int GenerateRandomId()
        {
            DateTime now = TimeHelper.GetDateTimeVietnam();
            return (int)(now.Ticks % int.MaxValue); // Sử dụng modulo để đảm bảo trong giới hạn int
        }
    }
}
