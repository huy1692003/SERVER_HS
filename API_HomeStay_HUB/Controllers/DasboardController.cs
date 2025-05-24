using API_HomeStay_HUB.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

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
            var totalHomeStay = db.HomeStays.Count(s => s.OwnerID == idOwner);
            var totalBookingWaiting = db.Bookings.Count(s => s.OwnerID == idOwner && s.status == 1);

            var sumRevenue = db.Bookings
                .Join(db.BookingProcesses, bk => bk.BookingID, prs => prs.BookingID, (bk, prs) => new { bk, prs })
                .Where(s => s.bk.OwnerID == idOwner && s.prs.PaymentTime != null)
                .Sum(s => s.bk.TotalPrice);

            var totalAds = db.Advertisements.Count(s => s.OwnerID == idOwner);

            var totalPayment = (from payment in db.Payments
                                join booking in db.Bookings on payment.BookingID equals booking.BookingID
                                where booking.OwnerID == idOwner && payment.BookingID != null
                                select new { payment })
                                .Count();

            var yearCurrent = DateTime.Now.Year;
            // Doanh thu theo từng tháng trong năm
            var revenueByMonth = db.Bookings
                .Join(db.BookingProcesses, bk => bk.BookingID, prs => prs.BookingID, (bk, prs) => new { bk, prs })
                .Where(s => s.bk.OwnerID == idOwner && s.prs.PaymentTime != null && s.bk.BookingTime.Value.Year==yearCurrent)
                .GroupBy(s => new { Month = s.prs.PaymentTime.Value.Month, Year = s.prs.PaymentTime.Value.Year })  // Nhóm theo tháng và năm
                .Select(g => new
                {
                    Year = g.Key.Year,
                    Month = g.Key.Month,
                    TotalRevenue = g.Sum(s => s.bk.TotalPrice)
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
                ListAdvertisement=listAdvertisement,
            };

            return Ok(dashboardData);
        }

        [HttpGet("admin")]
        public async Task<IActionResult> getDashboadAdmin()
        {
            var totalOwner= db.OwnerStays.Count();
            var totalPartnership=db.PartnershipRegs.Count(s=>s.Status==0);
            var totalAdsWaiting = db.Advertisements.Count(s => s.StatusAd == 0);
            var homestayWaiting=db.HomeStays.Count(s=>s.StatusHomestay == 0);
            var totalUser = db.Users.Count();
            var revenueAds = db.Advertisements.Where(s=>s.StatusAd>=2).Sum(s => s.Cost);


            var yearCurrent = DateTime.Now.Year;
            // Doanh thu theo từng tháng trong năm
            var revenueByMonth = db.Bookings
                .Join(db.BookingProcesses, bk => bk.BookingID, prs => prs.BookingID, (bk, prs) => new { bk, prs })
                .Where(s => s.prs.PaymentTime != null && s.bk.BookingTime.Value.Year == yearCurrent)
                .GroupBy(s => new { Month = s.prs.PaymentTime.Value.Month, Year = s.prs.PaymentTime.Value.Year })  // Nhóm theo tháng và năm
                .Select(g => new
                {
                    Year = g.Key.Year,
                    Month = g.Key.Month,
                    TotalRevenue = g.Sum(s => s.bk.TotalPrice)
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
            return Ok(result );

        }

    }
}
