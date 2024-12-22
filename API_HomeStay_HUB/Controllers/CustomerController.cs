using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly IUserService _userService;

        public CustomerController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost("register")]
        public async Task<IActionResult> registerCus([FromBody] RegisterCusDTO reg)
        {
            if (await _userService.addUser(new Model.User { Username = reg.Username, Password = reg.Password, FullName = reg.Fullname, Gender = reg.Gender , Email=reg.Email }, 2))
            {
                return Ok("Đăng kí thành công");
            }

            return BadRequest("Đăng kí thất bại , tên tài khoản đã tồn tại hãy nhập tên tài khoản khác");

        }
        [HttpGet("login")]
        public async Task<IActionResult> login(string Username, string Password)
        {
            var LoginRes = await _userService.loginUser(Username, Password);
            if (LoginRes != null)
            {
                return Ok(LoginRes);
            }

            return NotFound("Đăng nhập thất bại thông tin tài khoản hoặc mật khẩu không chính xác hoặc tài khoản của bạn đã bị khóa");

        }
        //public async Task<IActionResult> GetAllUsersWithCustomers()
        //{
        //    var usersWithCustomers = from user in dbContext.Users
        //                             join customer in dbContext.Customers
        //                             on user.UserID equals customer.CustomerID
        //                             select user;

        //    return Ok(await usersWithCustomers.ToListAsync());
        //}
    }
}
