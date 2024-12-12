using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdvertisementController : ControllerBase
    {
        private readonly DBContext _db;
        private readonly ISendMaillService sendMaillService;
        public AdvertisementController(DBContext db, ISendMaillService service)
        {
            this._db = db;
            this.sendMaillService = service;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllAdvertisements()
        {
            UpdateStatusByDateNow();

            var today = DateTime.Now.Date;

            var ads = await _db.Advertisements
                .Where(s => s.StatusAd == 3 && today >= s.StartDate.Date && today < s.EndDate.Date).OrderByDescending(s => s.CreatedDate)
                .ToListAsync();

            return Ok(ads);
        }


        [HttpPost("getAdvertisementManager")]
        public async Task<IActionResult> GetAllAdvertisementsByStatus([FromBody] SearchAdvertisementDTO req, [FromQuery] int status = 10, [FromQuery] string owner = "")
        {
            try
            {
                DateTime dateStart = new DateTime();
                DateTime dateEnd = new DateTime();
                if (req.DateStart != null || req.DateEnd != null)
                {
                    dateStart = Convert.ToDateTime(req.DateStart);
                    dateEnd = Convert.ToDateTime(req.DateEnd);
                }
                UpdateStatusByDateNow();
                var ads = await _db.Advertisements.Where
                    (s =>
                    (status == 10 || s.StatusAd == status)
                    && (owner == "" || s.OwnerID == owner)
                    && (string.IsNullOrEmpty(req.Title) || s.AdTitle!.Contains(req.Title))
                    && (req.Placement == null || s.Placement == req.Placement)
                    && (req.DateStart == null || s.StartDate.Date == dateStart.Date)
                    && (req.DateEnd == null || s.EndDate.Date == dateEnd.Date))
                    .OrderByDescending(s => s.CreatedDate).ToListAsync();
                return Ok(ads);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpPut("updateStatus")]
        public IActionResult updateStatusAdvertisement(int idAd, int status, string reasonReject = "")
        {
            Advertisement? advertisement = _db.Advertisements.FirstOrDefault(s => s.AdID == idAd);
            if (advertisement != null)
            {
                // Cập nhật trạng thái của quảng cáo
                if (status == -1)
                {
                    advertisement.StatusAd = -1;
                    advertisement.ReasonReject = reasonReject;
                }

                else
                {
                    advertisement.StatusAd = status;
                }

                // Lưu thay đổi vào DB
                _db.SaveChanges();

                // Lấy thông tin owner từ bảng OwnerStays
                var owner = _db.OwnerStays.Include(s => s.User).FirstOrDefault(s => s.OwnerID == advertisement.OwnerID);
                if (owner != null && owner.User != null)
                {
                    string email = owner.User.Email;

                    // Tạo nội dung email HTML
                    string subject = "Thông báo về đơn đăng ký quảng cáo";
                    string content = $@"
                    <h3>Xin chào {owner.User.FullName},</h3>
                    <p>Quảng cáo của bạn với mã số <strong>{advertisement.AdID}</strong> đã được chúng tôi xem qua và xét duyệt .</p>
                   ";


                    if (status == -1)
                    {
                        content += $"<p><strong>Do có một số tiêu chí không phù hợp nên chúng tôi đã từ chối , bạn hãy xem lý do dưới đây:</strong> {reasonReject}</p>";
                        content += $"<p><strong>Lý do từ chối:</strong> {reasonReject}</p>";
                    }
                    else if (status == 1)
                    {
                        content += $"<p><strong>Giờ đây bạn hãy vào trang quản lý kênh HomeStay và vào phần Thanh toán và hãy thanh toán khoản tiền quảng cáo của bạn:</strong> {reasonReject}</p>";
                    }

                    content += "<p>Xin cảm ơn!</p>";
                    content += "<p>Đội ngũ HuyStay</p>";

                    // Gửi email với nội dung HTML
                    sendMaillService.SendMaill(email, subject, content);
                }

                return Ok("Cập nhật trạng thái thành công!");
            }
            else
            {
                return NotFound();
            }
        }

        // Hàm phụ để lấy văn bản trạng thái từ mã trạng thái
        private string GetStatusText(int status)
        {
            switch (status)
            {
                case 0: return "Chờ duyệt";
                case 1: return "Chờ thanh toán";
                case 2: return "Chờ hiển thị";
                case 3: return "Đang hiển thị";
                case 4: return "Không hiệu lực";
                case -1: return "Đã hủy";
                default: return "Không xác định";
            }
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> GetAdvertisementById(int id)
        {
            var ad = await _db.Advertisements.FindAsync(id);
            if (ad == null)
                return NotFound();
            return Ok(ad);
        }

        [HttpPost]
        public async Task<IActionResult> CreateAdvertisement(Advertisement advertisement)
        {
            try
            {
                advertisement.AdID = null;
                advertisement.CreatedDate = DateTime.Now;
                advertisement.TotalClick = 0;
                advertisement.StatusAd = 0;

                await _db.Advertisements.AddAsync(advertisement);
                await _db.SaveChangesAsync();

                return CreatedAtAction(nameof(GetAdvertisementById), new { id = advertisement.AdID }, advertisement);
            }
            catch (Exception ex)
            {
                {
                    return BadRequest(ex.Message);
                }
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateAdvertisement(int id, Advertisement advertisement)
        {
            if (id != advertisement.AdID)
                return BadRequest();

            var existingAd = await _db.Advertisements.FindAsync(id);
            if (existingAd == null)
                return NotFound();

            existingAd.OwnerID = advertisement.OwnerID;
            existingAd.AdTitle = advertisement.AdTitle;
            existingAd.AdDescription = advertisement.AdDescription;
            existingAd.AdPicture = advertisement.AdPicture;
            existingAd.UrlClick = advertisement.UrlClick;
            existingAd.StartDate = advertisement.StartDate;
            existingAd.EndDate = advertisement.EndDate;
            existingAd.StatusAd = advertisement.StatusAd;
            existingAd.UpdatedDate = DateTime.Now;

            await _db.SaveChangesAsync();
            return Ok("success");
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteAdvertisement(int id)
        {
            var ad = await _db.Advertisements.FindAsync(id);
            if (ad == null)
                return NotFound();
            _db.Advertisements.Remove(ad);
            await _db.SaveChangesAsync();
            return NoContent();
        }

        [HttpPut("incrementClick/{id}")]
        public async Task<IActionResult> IncrementClick(int id)
        {
            var ad = await _db.Advertisements.FindAsync(id);
            if (ad == null)
                return NotFound();

            ad.TotalClick = (ad.TotalClick ?? 0) + 1;
            await _db.SaveChangesAsync();
            return NoContent();
        }

        private void UpdateStatusByDateNow()
        {
            var dateNow = DateTime.Now.Date;

            // Cập nhật trạng thái quảng cáo hết hạn
            var expiredAds = _db.Advertisements.Where(ad => ad.EndDate.Date <= dateNow && ad.StatusAd == 3 && ad.StatusAd != 4).ToList();
            foreach (var ad in expiredAds)
            {
                ad.StatusAd = 4;
            }

            // Cập nhật trạng thái quảng cáo bắt đầu hiển thị
            var activeAds = _db.Advertisements.Where(ad => ad.StartDate.Date <= dateNow &&ad.StatusAd==2 && ad.StatusAd != 3).ToList();
            foreach (var ad in activeAds)
            {
                ad.StatusAd = 3;
            }

            // Lưu các thay đổi vào cơ sở dữ liệu
            _db.SaveChanges();
        }
    }
}
