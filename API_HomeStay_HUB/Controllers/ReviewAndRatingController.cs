using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Helpers;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewAndRatingController : ControllerBase
    {
        private readonly IReviewAndRatingService _reviewAndRatingService;
        private readonly DBContext dBContext;
        public ReviewAndRatingController(IReviewAndRatingService reviewAndRatingService, DBContext db)
        {
            _reviewAndRatingService = reviewAndRatingService;
            this.dBContext = db;
        }
        [HttpGet("getReviewByHomeStay/{id}")]
        public async Task<IActionResult> getReviewByHomeStay(int id)
        {
            var result = await (from rv in dBContext.ReviewAndRatings
                                join h in dBContext.HomeStays on rv.HomestayID equals h.HomestayID
                                join bk in dBContext.Bookings on rv.BookingID equals bk.BookingID
                               
                                // Left Join với Customer
                                join cus in dBContext.Customers on rv.CustomerID equals cus.CusID into customerGroup
                                from customer in customerGroup.DefaultIfEmpty()

                                    // Left Join với User
                                join u in dBContext.Users on customer.UserID equals u.UserID into userGroup
                                from user in userGroup.DefaultIfEmpty()

                                where rv.HomestayID == id
                                orderby rv.ReviewDate descending
                                select new
                                {
                                    rv,
                                    fullName = customer != null && user != null ? user.FullName : bk.Name,
                                    gender = customer != null && user != null ? user.Gender : 1,
                                    avatar = customer != null && user != null ? user.ProfilePicture : null,
                                    detailBooking = JsonConvert.DeserializeObject<List<DetailBooking>>(bk.DetailBookingString),
                                }
               ).ToListAsync();
            return Ok(result);
        }

        [HttpGet("getReviewByOwner/{idOwner}")]
        public async Task<IActionResult> getReviewByOwner(string idOwner)
        {
            var result = await (from rv in dBContext.ReviewAndRatings
                                join h in dBContext.HomeStays
                                on rv.HomestayID equals h.HomestayID
                                join owner in dBContext.OwnerStays
                                on h.OwnerID equals owner.OwnerID
                                where owner.OwnerID == idOwner
                                orderby rv.ReviewDate descending
                                select rv
                          ).ToListAsync();

            return Ok(result);
        }

        [HttpPost("add")]
        public async Task<IActionResult> addReviewAndRating([FromBody] ReviewAndRating rv)
        {
            int id = new Random().Next(1000000000);
            rv.ReviewID = id;
            if (await _reviewAndRatingService.addReview(rv))
            {
                return Ok("Thêm đánh giá thành công");
            }
            return BadRequest("Dữ liệu đánh giá không hợp lệ");
        }
    }
}
