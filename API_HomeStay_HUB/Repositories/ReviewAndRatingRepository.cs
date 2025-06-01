using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Helpers;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Repositories
{
    public class ReviewAndRatingRepository : IReviewAndRatingRepository
    {
        private readonly DBContext _dBContext;
        public ReviewAndRatingRepository(DBContext dbContext)
        {
            _dBContext = dbContext;
        }
        public async Task<bool> addReview(ReviewAndRating reviewAndRating)
        {
            await _dBContext.ReviewAndRatings.AddAsync(reviewAndRating);


            var booking = await _dBContext.Bookings.FirstOrDefaultAsync(s => s.BookingID == reviewAndRating.BookingID);
            booking!.timeReviewRating = TimeHelper.GetDateTimeVietnam();
            var homeStay = await _dBContext.HomeStays.FirstOrDefaultAsync(s => s.HomestayID == reviewAndRating.HomestayID);
            if (homeStay != null)
            {

                homeStay!.TotalScore += reviewAndRating.Rating;
                homeStay.ReviewCount += 1;
                homeStay.AverageRating = homeStay.ReviewCount >= 1 ? Math.Round((double)homeStay.TotalScore! / (double)homeStay.ReviewCount!, 1) : reviewAndRating.Rating;
            }


            return await _dBContext.SaveChangesAsync() > 0;
        }
        public async Task<IEnumerable<ReviewAndRating?>> getReviews_ByHomeStay(int idHomeStay)
        {
            return await _dBContext.ReviewAndRatings.Where(r => r.HomestayID == idHomeStay).ToListAsync();
        }
    }
}
