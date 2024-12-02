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
        public UserController(DBContext db,IUserService userService)
        {
            dbContext = db;
            _userService = userService;
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
            var usersWithCustomers = await dbContext.OwnerStays.ToListAsync();

            return Ok(usersWithCustomers);
        }
        [HttpGet("getAdminstrator")]
        public async Task<IActionResult> GetAdminStator()
        {
            var usersWithCustomers = await dbContext.Administrators.ToListAsync();

            return Ok(usersWithCustomers);
        }
    }
}
