using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly DBContext dbContext;
        private readonly IUserService _userService;
        private readonly ISendMaillService _sendMaillService;
        public UserController(DBContext db,IUserService userService,ISendMaillService sen)
        {
            dbContext = db;
            _userService = userService;
            _sendMaillService = sen;
        }
       
        [HttpGet]
        public async Task<IActionResult> GetAllUsersWithCustomers()
        {
            var usersWithCustomers = await dbContext.Users.ToListAsync();

            return Ok(usersWithCustomers);
        }

        [HttpGet("getCustomer")]
        public async Task<IActionResult> GetAllUCustomer()
        {
            var usersWithCustomers = await dbContext.Customers.ToListAsync();

            return Ok(usersWithCustomers);
        }

        [HttpGet("getOwnerStay")]
        public async Task<IActionResult> GetOwnerStay()
        {
            var owners = await (from owner in dbContext.OwnerStays
                                            join user in dbContext.Users
                                            on owner.UserID equals user.UserID
                                            join cus in dbContext.Customers
                                            on user.UserID equals cus.UserID
                                            join part in dbContext.PartnershipRegs
                                            on cus.CusID equals part.CustomerID
                                            select new
                                            {
                                                User = user,
                                                IdOwner = owner.OwnerID,
                                                timePart= part.CreatedAt
                                            }).ToListAsync();
            return Ok(owners.DistinctBy(s=>s.User.Username));
        }

        [HttpDelete("deleteOwner")]
        public async Task<IActionResult> DeleteOwner(string idOwner)
        {
            try
            {
                // Tìm Owner theo ID
                var owner = await dbContext.OwnerStays.FirstOrDefaultAsync(s => s.OwnerID == idOwner);
                if (owner == null)
                {
                    return NotFound(new { message = "Owner không tồn tại." });
                }

                // Tìm User liên quan đến Owner
                var user = await dbContext.Users.FirstOrDefaultAsync(s => s.UserID == owner.UserID);
                if (user == null)
                {
                    return NotFound(new { message = "User liên quan không tồn tại." });
                }

                // Bắt đầu giao dịch
                using var transaction = await dbContext.Database.BeginTransactionAsync();

                try
                {
                    // Xóa User
                    dbContext.Users.Remove(user);
                    await dbContext.SaveChangesAsync();

                    // Xóa Owner
                    dbContext.OwnerStays.Remove(owner);
                    await dbContext.SaveChangesAsync();

                    // Hoàn tất giao dịch
                    await transaction.CommitAsync();

                    return Ok(new { message = "Xóa Owner và User thành công." });
                }
                catch
                {
                    // Rollback nếu có lỗi
                    await transaction.RollbackAsync();
                    throw;
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi chung
                return StatusCode(500, new { message = "Có lỗi xảy ra.", error = ex.Message });
            }
        }


        public class Mail_Content
        {
            public string title { get; set; }
            public string content { get; set; }

            public string emailTo { get; set; }   
        }

        [HttpPost("sendmailOwner")]
        public async Task<IActionResult> sendmailOwner([FromQuery] string idOwner, [FromBody] Mail_Content mail)
        {
            await _sendMaillService.SendMaill(mail.emailTo, mail.title, mail.content);
            return Ok("send success");
        }


        [HttpGet("getAdminstrator")]
        public async Task<IActionResult> GetAdminStator()
        {
            var usersWithCustomers = await dbContext.Administrators.ToListAsync();

            return Ok(usersWithCustomers);
        }

        [HttpGet("updateStatus/{idUser}/{status}")]
        public async Task<IActionResult> updateStatus(string idUser , int status)
        {
            var user = dbContext.Users.FirstOrDefault(s => s.UserID == idUser);
            if (user == null)
            {
                return BadRequest();
            }    
            user.Status = status;
            dbContext.SaveChanges();
            return Ok();
        }



    }
}
