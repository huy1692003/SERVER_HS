using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DasboardController : ControllerBase
    {
        private readonly DBContext db;
        public DasboardController(DBContext db)
        {
            this.db = db;
        }

        [HttpGet("owner/{idOwner}")]
        public async Task<IActionResult> getDashboard(string idOwner)
        {
            var dateCurrent = DateTime.Now.Date;
            var totalHomeStay = db.HomeStays.Count(s => s.OwnerID == idOwner);
            var totalBookingWaiting = db.Bookings.Count(s => s.OwnerID == idOwner && s.status == 1);

            var sumRevenue = db.Bookings
                .Join(db.BookingProcesses, bk => bk.BookingID, prs => prs.BookingID, (bk, prs) => new { bk, prs })
                .Where(s => s.bk.OwnerID == idOwner && s.prs.PaymentTime != null && s.bk.IsSuccess && (s.prs.PaymentTime.Value.Year == dateCurrent.Year && s.prs.PaymentTime.Value.Month == dateCurrent.Month))
                .Sum(s => s.bk.TotalPrice + s.bk.ExtraCost);

            var totalAds = db.Advertisements.Where(s => s.StatusAd == 3).Count(s => s.OwnerID == idOwner);

            var totalPayment = (from payment in db.Payments
                                join booking in db.Bookings on payment.BookingID equals booking.BookingID
                                where booking.OwnerID == idOwner && payment.BookingID != null
                                select new { payment })
                                .Count();
            var listHomestay = (from hs in db.HomeStays
                                where hs.OwnerID == idOwner && hs.StatusHomestay >0
                                select new
                                {
                                    hs.HomestayID,
                                    hs.HomestayName,
                                    hs.Province,
                                    hs.WardOrCommune,
                                    hs.AverageRating,
                                    hs.ImageHomestay,
                                    hs.TimeCheckIn,
                                    hs.TimeCheckOut,
                                    hs.ViewCount,
                                    hs.ReviewCount,
                                    countBK = db.Bookings.Where(s=>s.HomeStayID==hs.HomestayID&&!s.IsCancel).Count()
                                }).OrderByDescending(s=>s.countBK).ToList();
                              

            // Doanh thu theo từng tháng trong năm
            var revenueByMonth = db.Bookings
                .Join(db.BookingProcesses, bk => bk.BookingID, prs => prs.BookingID, (bk, prs) => new { bk, prs })
                .Where(s => s.bk.OwnerID == idOwner && s.prs.PaymentTime != null && s.bk.CheckOutDate.Year == dateCurrent.Year)
                .GroupBy(s => new { Month = s.prs.PaymentTime.Value.Month, Year = s.prs.PaymentTime.Value.Year })  // Nhóm theo tháng và năm
                .Select(g => new
                {
                    Year = g.Key.Year,
                    Month = g.Key.Month,
                    TotalRevenue = g.Sum(s => s.bk.TotalPrice + s.bk.ExtraCost)
                })
                .OrderBy(r => r.Year).ThenBy(r => r.Month)  // Sắp xếp theo năm và tháng
                .ToList();


            var listAdvertisement = db.Advertisements.Where(s => s.OwnerID == idOwner).Select(s => new { s.AdID, s.AdTitle, s.TotalClick });
            // Trả về kết quả
            var dashboardData = new
            {
                TotalHomeStay = totalHomeStay,
                TotalBookingWaiting = totalBookingWaiting,
                SumRevenue = sumRevenue,
                TotalAds = totalAds,
                TotalPayment = totalPayment,
                RevenueByMonth = revenueByMonth,
                ListAdvertisement = listAdvertisement,
                listHomestay= listHomestay,
            };

            return Ok(dashboardData);
        }

        [HttpGet("admin")]
        public async Task<IActionResult> getDashboadAdmin()
        {
            var PhiSan = (await db.Settings.FirstOrDefaultAsync(s => s.Key == "floorFee"))?.Value; // Phí sàn
            double phanTramPhiSan = Convert.ToDouble(PhiSan ?? "10");
            double PhanTram = (phanTramPhiSan / 100);

            var dateCurrent = DateTime.Now.Date;
            var totalOwner = db.OwnerStays.Count();
            var totalPartnership = db.PartnershipRegs.Count(s => s.Status == 0);
            var totalAdsWaiting = db.Advertisements.Count(s => s.StatusAd == 0);
            var homestayWaiting = db.HomeStays.Count(s => s.StatusHomestay == 0);
            var totalUser = db.Users.Count();
            var revenueAds = db.Advertisements.Where(s => s.TimePayment!=null && s.TimePayment.Value.Month==dateCurrent.Month&& s.TimePayment.Value.Year==dateCurrent.Year).ToList();


            var yearCurrent = DateTime.Now.Year;
            // Doanh thu theo từng tháng trong năm
            var revenueByMonth = db.Bookings

                .Join(db.BookingProcesses, bk => bk.BookingID, prs => prs.BookingID, (bk, prs) => new { bk, prs })
                .Where(s => s.prs.PaymentTime != null && s.bk.IsSuccess && s.bk.CheckOutDate.Year == yearCurrent)
                .GroupBy(s => new { Month = s.prs.CheckOutTime!.Value.Month, Year = s.prs.CheckOutTime.Value.Year })  // Nhóm theo tháng và năm
                .Select(g => new
                {
                    Year = g.Key.Year,
                    Month = g.Key.Month,
                    TotalRevenue = g.Sum(s => s.bk.TotalPrice * PhanTram),
                    totalBooking=g.Count()
                })
                .OrderBy(r => r.Year).ThenBy(r => r.Month)  // Sắp xếp theo năm và tháng
                .ToList();


            // Trả về kết quả
            var result = new
            {
                TotalOwner = totalOwner,
                TotalPartnership = totalPartnership,
                TotalAdsWaiting = totalAdsWaiting,
                HomestayWaiting = homestayWaiting,
                TotalUser = totalUser,
                RevenueAds = revenueAds,
                RevenueByMonth = revenueByMonth
            };
            return Ok(result);

        }

        [HttpPost("owner/getBookingStatistics")]
        public async Task<IActionResult> GetBookingStatisticsByOwnerAndDate([FromQuery] string OwnerId, [FromBody] BookingStatisticsRequestDTO request)
        {
            var PhiSan = (await db.Settings.FirstOrDefaultAsync(s => s.Key == "floorFee"))?.Value; // Phí sàn
            double phanTramPhiSan = Convert.ToDouble(PhiSan ?? "10");
            double PhanTram = 1 - (phanTramPhiSan / 100);
            try
            {
                if (string.IsNullOrEmpty(OwnerId))
                {
                    return BadRequest("OwnerId is required.");
                }

                DateTime startTime = Convert.ToDateTime(request.StartDate).Date;
                DateTime endTime = Convert.ToDateTime(request.EndDate).Date;

                // Lấy danh sách booking theo điều kiện
                var bookings = await db.Bookings
                    .Where(b => b.OwnerID == OwnerId
                                && b.IsSuccess
                                && b.CheckInDate.Date >= startTime
                                && b.CheckOutDate.Date <= endTime)
                    .Select(bk => new
                    {
                        bk.BookingID,
                        bk.HomeStayID,
                        bk.TotalPrice,
                        bk.ExtraCost,
                        bk.LinkBill,
                        bk.Name,
                        bk.Email,
                        bk.phoneOwner,
                        bk.CheckOutDate,
                        bk.CMND,
                        bk.DiscountPrice,
                        bk.DiscountCode,
                        bk.DetailBookingString,
                        bk.OriginalPrice,
                        revenueBK = (bk.TotalPrice * PhanTram) + bk.ExtraCost
                    }
                    ).ToListAsync();

                // Tổng số booking
                int totalBookings = bookings.Count;

                // Tổng doanh thu từ DetailBooking (nếu có dữ liệu)
                double totalRevenue = bookings.Sum(s => s.revenueBK) ?? 0;


                return Ok(new
                {
                    TotalBookings = totalBookings,
                    TotalRevenue = totalRevenue,
                    Bookings = bookings,
                    FloorFee = PhiSan,
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }

        public class BookingStatisticsRequestDTO
        {

            public DateTime StartDate { get; set; }
            public DateTime EndDate { get; set; }
        }



    }
}
