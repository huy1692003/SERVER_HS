using System.Globalization;
using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Helpers;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RevenueController : ControllerBase
    {

        private readonly DBContext dBContext;
        private readonly ExportExcel exportExcel;
        public RevenueController(DBContext dBContext , ExportExcel excel)
        {
            this.dBContext = dBContext;
            this.exportExcel = excel;   
        }

        [HttpPost("GetAllRevenueByDate")]
        public async Task<IActionResult> GetAllRevenueByDate([FromQuery] PaginateDTO paginate, [FromBody] RevenueReqDTO request)
        {
            // Lọc các hóa đơn theo khoảng thời gian
            var bookings = dBContext.Bookings
                .Where(bk => (!request.Start.HasValue || bk.BookingTime >= request.Start.Value.Date) &&
                             (!request.End.HasValue || bk.BookingTime <= request.End.Value.Date));

            // Tính doanh thu theo OwnerID
            var data = (from bk in bookings
                        join bk_prs in dBContext.BookingProcesses
                        on bk.BookingID equals bk_prs.BookingID
                        join owner in dBContext.OwnerStays
                        on bk.OwnerID equals owner.OwnerID
                        join user in dBContext.Users
                        on owner.UserID equals user.UserID
                        where bk_prs.PaymentTime != null &&
                              (string.IsNullOrEmpty(request.PhoneOwner) || user.PhoneNumber == request.PhoneOwner) &&
                              (string.IsNullOrEmpty(request.Username) || user.Username == request.Username)
                        group bk by new
                        {
                            owner.OwnerID,
                            user.FullName,
                            user.PhoneNumber,
                            user.Email,
                            user.Username,
                            user.Address
                        } into g
                        select new
                        {
                            fullname = g.Key.FullName,
                            phone = g.Key.PhoneNumber,
                            email = g.Key.Email,
                            username = g.Key.Username,
                            address = g.Key.Address,
                            revenue = g.Sum(x => x.TotalPrice) // Tổng tiền hóa đơn
                        });
            var total = await data.CountAsync();
            var items = await  data.Skip((paginate.Page - 1) * paginate.PageSize).Take(paginate.PageSize).ToListAsync();

            return Ok(new { TotalCount = total, Items = items });

        }
        [HttpPost("exportExcel")]
        public async Task<IActionResult> ExportPDF([FromBody] RevenueReqDTO request)
        {
            try
            {
                // Lọc các hóa đơn theo khoảng thời gian
                var bookings = dBContext.Bookings
                    .Where(bk => (!request.Start.HasValue || bk.BookingTime >= request.Start.Value.Date) &&
                                 (!request.End.HasValue || bk.BookingTime <= request.End.Value.Date));

                // Tính doanh thu theo OwnerID
                var data = await (from bk in bookings
                                  join bk_prs in dBContext.BookingProcesses
                                  on bk.BookingID equals bk_prs.BookingID
                                  join owner in dBContext.OwnerStays
                                  on bk.OwnerID equals owner.OwnerID
                                  join user in dBContext.Users
                                  on owner.UserID equals user.UserID
                                  where bk_prs.PaymentTime != null &&
                                        (string.IsNullOrEmpty(request.PhoneOwner) || user.PhoneNumber == request.PhoneOwner) &&
                                        (string.IsNullOrEmpty(request.Username) || user.Username == request.Username)
                                  group bk by new
                                  {
                                      owner.OwnerID,
                                      user.FullName,
                                      user.PhoneNumber,
                                      user.Email,
                                      user.Username,
                                      user.Address
                                  } into g
                                  select new
                                  {
                                      fullname = g.Key.FullName,
                                      phone = g.Key.PhoneNumber,
                                      email = g.Key.Email,
                                      username = g.Key.Username,
                                      address = g.Key.Address,
                                      revenue_owner_origin = string.Format(new CultureInfo("vi-VN"), "{0:C0}", g.Sum(x => x.TotalPrice)), // Tổng tiền hóa đơn
                                      revenue_owner = string.Format(new CultureInfo("vi-VN"), "{0:C0}", g.Sum(x => x.TotalPrice) * 0.9),   // Tổng tiền hóa đơn
                                      revenueText = string.Format(new CultureInfo("vi-VN"), "{0:C0}", g.Sum(x => x.TotalPrice) * 0.1),        // Tổng tiền hóa đơn
                                      revenue = g.Sum(x => x.TotalPrice) * 0.1,        // Tổng tiền hóa đơn
                                  }).ToListAsync();


                // Danh sách tên cột
                var columnNames = new List<string> { "Tên đối tác", "Số điện thoại", "Email", "Tên đăng nhập", "Địa chỉ", "Thực lĩnh từ đối tác", "Phải trả đối tác", "Doanh thu " ,"" };

                // Sử dụng hàm ExportToExcel để tạo file Excel
                var fileBytes = exportExcel.ExportToExcel(
                    data, columnNames,
                    "export.xlsx",
                    "Tổng doanh thu từ ngày " + TimeHelper.formatDateVN(request.Start,"date") + " đến ngày " + TimeHelper.formatDateVN(request.End.Value,"date"),
                    "Tổng doanh thu của công ty = " + string.Format(new CultureInfo("vi-VN"), "{0:C0}", data.Sum(s => s.revenue)));

                // Trả về file Excel dưới dạng file tải xuống
                return File(fileBytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "export.xlsx");
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }


        //Thống kê chủ homestay 

        



    }
}
