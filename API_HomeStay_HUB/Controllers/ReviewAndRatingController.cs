using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReviewAndRatingController : ControllerBase
    {
        private readonly IReviewAndRatingService _reviewAndRatingService;
        private readonly DBContext dBContext;
        public ReviewAndRatingController(IReviewAndRatingService reviewAndRatingService , DBContext db)
        {
            _reviewAndRatingService = reviewAndRatingService;
            this.dBContext = db;
        }
        [HttpGet("getReviewByHomeStay/{id}")]
        public async Task<IActionResult> getReviewByHomeStay(int id)
        {

            var result = await (from rv in dBContext.ReviewAndRatings
                                join h in dBContext.HomeStays on rv.HomestayID equals h.HomestayID
                                join c in dBContext.Customers on rv.CustomerID equals c.CusID
                                join u in dBContext.Users on c.UserID equals u.UserID
                                where rv.HomestayID == id
                                orderby rv.ReviewDate descending
                                select new { rv,u.FullName,u.Gender }
                          ).ToListAsync();

            return Ok(result);
        } 


        [HttpGet("getReviewByOwner/{idOwner}")]
        public async Task<IActionResult> getReviewByOwner(string idOwner  )
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
