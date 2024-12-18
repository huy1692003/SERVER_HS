using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PromotionController : ControllerBase
    {
        private readonly IPromotionService _promotionService;
        private readonly DBContext dB;

        public PromotionController(IPromotionService promotionService, DBContext db )
        {
            _promotionService = promotionService;
            dB = db;
        }

        // GET: api/promotion/getAll
        [HttpGet("getAll")]
        public async Task<ActionResult<IEnumerable<Promotion>>> GetAllPromotions()
        {
            var promotions = await _promotionService.GetAll();
            return Ok(promotions);
        }

        [HttpGet("getbyOwnerID")]
        public async Task<ActionResult<IEnumerable<Promotion>>> GetByOwner(string owner)
        {
            var promotions = await dB.Promotions.Where(s => s.OwnerID == owner).ToListAsync();
            return Ok(promotions);
        }

        //GET: api/promotion/getByID/{id}

        //checked voucher hợp lệ 
        [HttpGet("getByCode/{code}")]
        public async Task<IActionResult> GetPromotionById(string code)
        {
            var date= DateTime.Now;
            var promotion = await dB.Promotions.FirstOrDefaultAsync(s=>s.DiscountCode ==code && s.StartDate<=date.Date && s.EndDate>=date );
            return promotion != null ? Ok(promotion) : NotFound();
        }

        // POST: api/promotion/create
        [HttpPost("create")]
        public async Task<IActionResult> AddPromotion([FromBody] Promotion promotion)
        {
            if (promotion == null)
            {
                return BadRequest("Promotion không được trống");
            }

            bool state = await _promotionService.Add(promotion);
            return state ?
                CreatedAtAction(nameof(GetPromotionById), new { id = promotion.PrmID }, promotion) :
                BadRequest("Promotion không hợp lệ.");
        }

        // PUT: api/promotion/update
        [HttpPut("update")]
        public async Task<IActionResult> UpdatePromotion([FromBody] Promotion promotion)
        {
            if (promotion == null)
            {
                return BadRequest("Promotion không được để trống");
            }

            bool state = await _promotionService.Update(promotion);
            return state ? NoContent() : BadRequest("Promotion không hợp lệ.");
        }

        // DELETE: api/promotion/delete/{id}
        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeletePromotion(int id)
        {
            bool state = await _promotionService.Delete(id);
            return state ? NoContent() : NotFound();
        }
    }
}
