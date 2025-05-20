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



        [HttpGet("getAutocompleteLocation")]
        public IActionResult getAutocompleteLocation(string? par)
        {
            if (string.IsNullOrEmpty(par))
            {
                return Ok(new List<string>());
            }
            var dataProvince = _dBContext.HomeStays.Select(s => s.Province).Distinct().ToList();
            var dataDistric = _dBContext.HomeStays.Select(s => s.District).Distinct().ToList();
            var dataWard = _dBContext.HomeStays.Select(s => s.WardOrCommune).Distinct().ToList();
            var list = dataProvince.Concat(dataDistric).Concat(dataWard).ToList();

            if (list.Count == 0)
            {
                return Ok(new List<string>());
            }
            else
            {

                return Ok(list.Where(s => s!.Contains(par)).ToList());
            }
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

        [HttpPost("getHomeStayByAdminOrOwner")]
        public async Task<IActionResult> getHomeStay([FromQuery] string? idOwner, [FromQuery] int status, [FromQuery] PaginateDTO paginate, [FromBody] SearchHomeStayAdminDTO search)
        {
            double PriceStart = 0, PriceEnd = 0;
            if (!string.IsNullOrEmpty(search.PriceRange))
            {
                string[] PriceString = search.PriceRange.Split("-");
                PriceStart = double.Parse(PriceString[0]);
                PriceEnd = double.Parse(PriceString[1]);
            }
            // Truy vấn tổng hợp để lấy cả tổng số bản ghi và dữ liệu phân trang
            var query = from HomeStay in _dBContext.HomeStays
                        join DetailHomeStay in _dBContext.DetailHomeStays
                        on HomeStay.HomestayID equals DetailHomeStay.HomestayID
                        join owner in _dBContext.OwnerStays
                        on HomeStay.OwnerID equals owner.OwnerID
                        join user in _dBContext.Users
                        on owner.UserID equals user.UserID
                        where (string.IsNullOrEmpty(idOwner) || HomeStay.OwnerID == idOwner) && HomeStay.ApprovalStatus == status
                        &&
                        (search.Location == null ||
                            HomeStay.AddressDetail!.Contains(search.Location!) ||
                            HomeStay.Country!.Contains(search.Location!) ||
                            HomeStay.Province!.Contains(search.Location!) ||
                            HomeStay.District!.Contains(search.Location!)
                        )
                        && (search.Location == null ||
                            HomeStay.HomestayName!.Contains(search.Name!))
                        && (search.NumberofGuest == null ||
                            (search.NumberofGuest >= HomeStay.MinPerson && search.NumberofGuest <= HomeStay.MaxPerson)
                        )
                        && (string.IsNullOrEmpty(search.PriceRange) ||
                            (HomeStay.PricePerNight >= PriceStart && HomeStay.PricePerNight <= PriceEnd)
                        )
                        && (search.NumberOfBathrooms == null ||
                            DetailHomeStay.NumberOfBathrooms == search.NumberOfBathrooms
                        )
                        && (search.NumberOfLivingRooms == null ||
                            DetailHomeStay.NumberOfLivingRooms == search.NumberOfLivingRooms
                        )
                        && (search.NumberOfBedrooms == null ||
                            DetailHomeStay.NumberOfBedrooms == search.NumberOfBedrooms
                        )
                        && (search.NumberOfKitchens == null ||
                            DetailHomeStay.NumberOfKitchens == search.NumberOfKitchens
                        )

                        //Tìm kiếm phía admin 
                        && (string.IsNullOrEmpty(search.FullName) ||
                        user.FullName!.Contains(search.FullName!))
                        && (string.IsNullOrEmpty(search.UserName) ||
                        user.Username!.Contains(search.UserName!))
                        && (string.IsNullOrEmpty(search.Email) ||
                        user.Email!.Contains(search.Email!))
                        && (string.IsNullOrEmpty(search.Phone) ||
                        user.PhoneNumber!.Contains(search.Phone!))



                        orderby HomeStay.HomestayID descending
                        select new HomeStayResDTO
                        {
                            HomeStay = HomeStay,
                            DetailHomeStay = DetailHomeStay,
                            Owner = user
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
            if (homestay == null)
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

        [HttpGet("services")]
        public async Task<IActionResult> GetAllServices()
        {
            var services = await _homeStayService.GetAllServices();
            return Ok(services);
        }

        [HttpGet("services/{id}")]
        public async Task<IActionResult> GetServiceById(int id)
        {
            var service = await _homeStayService.GetServiceById(id);
            if (service == null)
            {
                return NotFound();
            }
            return Ok(service);
        }


        //Thao tac với dịch vụ
        [HttpPost("services")]
        public async Task<IActionResult> AddService([FromBody] Service service)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _homeStayService.AddService(service);
            if (result)
            {
                return CreatedAtAction(nameof(GetServiceById), new { id = service.ServiceID }, service);
            }
            return BadRequest("Failed to add service");
        }

        [HttpPut("services/{id}")]
        public async Task<IActionResult> UpdateService(int id, [FromBody] Service service)
        {
            if (id != service.ServiceID)
            {
                return BadRequest("Service ID mismatch");
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _homeStayService.UpdateService(service);
            if (result)
            {
                return NoContent();
            }
            return NotFound();
        }

        [HttpDelete("services/{id}")]
        public async Task<IActionResult> DeleteService(int id)
        {
            var result = await _homeStayService.DeleteService(id);
            if (result)
            {
                return NoContent();
            }
            return NotFound();
        }





    }
}
