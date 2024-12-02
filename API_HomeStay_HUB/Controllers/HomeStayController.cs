using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeStayController : ControllerBase
    {
        private readonly IHomeStayService _homeStayService;
        private readonly DBContext _dBContext;

        public HomeStayController(IHomeStayService homeStayService, DBContext dBContext)
        {
            _homeStayService = homeStayService;
            _dBContext = dBContext;
        }

        [HttpPost("getAll_ByStatus")]
        public async Task<IActionResult> GetHomeStay([FromQuery]int status,[FromBody]PaginateDTO paginate)
        {

            // Truy vấn tổng hợp để lấy cả tổng số bản ghi và dữ liệu phân trang
            var query = from HomeStay in _dBContext.HomeStays
                        join DetailHomeStay in _dBContext.DetailHomeStays
                        on HomeStay.HomestayID equals DetailHomeStay.HomestayID
                        where HomeStay.ApprovalStatus == status

                        select new HomeStayResDTO
                        {
                            HomeStay = HomeStay,
                            DetailHomeStay = DetailHomeStay,
                        };

            // Tính tổng số bản ghi
            int totalRecords = await query.CountAsync();

            // Lấy dữ liệu phân trang
            var data = await query
                        .Skip((paginate.Page - 1) * paginate.PageSize)
                        .Take(paginate.PageSize)
                        .ToListAsync();

            // Trả về dữ liệu cùng với tổng số bản ghi
            return Ok(new
            {
                page = paginate.Page,
                pageSize = paginate.PageSize,
                Items = data,
                TotalCount = totalRecords
            });

        }
        [HttpGet("getTop20ViewHight")]
        public async Task<IActionResult?> getHomeStayViewHight()
        {
            return Ok(await _homeStayService.getHomeStayViewHight());
        }

        [HttpPost("searchByCustomer")]

        public async Task<IActionResult> searchHomeStay([FromBody] SearchHomeStayDTO search, [FromQuery] PaginateDTO paginate)
        {
            var result = await _homeStayService.searchHomeStayByCustomer(search, paginate);
            return Ok(new
            {
                page = paginate.Page,
                pageSize = paginate.PageSize,
                items = result.Items,
                totalItems = result.TotalCount

            });
        }

        [HttpGet("getByID/{id}")]
        public async Task<IActionResult> GetHomeStayByID(int id)
        {
            var result = await _homeStayService.getHomeStayByID(id);
            if (result == null)
            {
                return NotFound();
            }
            return Ok(result);
        }


        [HttpPost("add")]
        public async Task<IActionResult> AddHomeStay([FromBody] HomeStayReqDTO homeStayReq)
        {
            if (homeStayReq == null)
            {
                return BadRequest("Dữ liệu HomeStay không được trống");
            }
            var isAdded = await _homeStayService.addHomeStay(homeStayReq);
            if (isAdded == true)
            {
                return CreatedAtAction(nameof(GetHomeStayByID), new { id = homeStayReq.HomeStay!.HomestayID }, homeStayReq);
            }
            return BadRequest("Dữ liệu HomeStay không hợp lệ");
        }

        [HttpPut("update")]
        public async Task<IActionResult> UpdateHomeStay([FromBody] HomeStayReqDTO homeStayReq)
        {
            if (await _homeStayService.updateHomeStay(homeStayReq))
            {
                return Ok("Cập nhật thành công HomeStay");
            }
            return BadRequest("Dữ liệu HomeStay cập nhật không hợp lệ");
        }

        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> DeleteHomeStay(int id)
        {
            var isDeleted = await _homeStayService.deleteHomeStay(id);
            if (!isDeleted)
            {
                return NotFound();
            }
            return Ok("Xóa thành công HomeStay");
        }

        [HttpPost("lock/{id}")]
        public async Task<IActionResult> LockHomeStay(int id)
        {
            var isLocked = await _homeStayService.lockHomeStay(id);
            if (!isLocked)
            {
                return NotFound();
            }
            return Ok("Lock sucess");
        }

        [HttpPost("getBy_idOwner")]
        public async Task<IActionResult> getBy_idOwner([FromQuery] string idOwner, [FromQuery] int status, [FromBody] PaginateDTO paginate)
        {


            // Truy vấn tổng hợp để lấy cả tổng số bản ghi và dữ liệu phân trang
            var query = from HomeStay in _dBContext.HomeStays
                        join DetailHomeStay in _dBContext.DetailHomeStays
                        on HomeStay.HomestayID equals DetailHomeStay.HomestayID
                        where HomeStay.OwnerID == idOwner && HomeStay.ApprovalStatus == status

                        select new HomeStayResDTO
                        {
                            HomeStay = HomeStay,
                            DetailHomeStay = DetailHomeStay,
                        };

            // Tính tổng số bản ghi
            int totalRecords = await query.CountAsync();

            // Lấy dữ liệu phân trang
            var data = await query
                        .Skip((paginate.Page - 1) * paginate.PageSize)
                        .Take(paginate.PageSize)
                        .ToListAsync();

            // Trả về dữ liệu cùng với tổng số bản ghi
            return Ok(new
            {
                page = paginate.Page,
                pageSize = paginate.PageSize,
                Items = data,
                TotalCount = totalRecords
            });


        }
        [HttpPut("updateStatusApproval")]
        public async Task<IActionResult> updateStatusApproval([FromQuery] int idHomestay, int status)
        {
            var homestay = await _dBContext.HomeStays.FirstOrDefaultAsync(s => s.HomestayID == idHomestay);
            if (homestay==null)
            {
                return NotFound();
            }
            homestay.ApprovalStatus = status;
            await _dBContext.SaveChangesAsync();
            return NoContent(); 
        }


        [HttpGet("viewHomeStayByID/{id}")]
        public async Task<IActionResult> viewHomeStayByID(int id)
        {

            var result = await _homeStayService.getHomeStayByID(id);
            if (result == null)
            {
                return NotFound();
            }
            _dBContext.HomeStays.FirstOrDefault(s => s.HomestayID == id)!.TotalView += 1;
            _dBContext.SaveChanges();
            return Ok(result);
        }




    }
}
