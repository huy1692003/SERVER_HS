using System.Text.Json;
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
    public class AdministratorController : ControllerBase
    {
        private IUserService _userService;
        private DBContext _dbContext;
        private readonly IRoleService _roleService;

        public AdministratorController(IUserService user, DBContext dBContext, IRoleService role)
        {
            this._userService = user;
            this._dbContext = dBContext;
            this._roleService = role;
        }

        [HttpGet("getAll")]
        public async Task<IActionResult> Get()
        {
            var result = await _dbContext.Administrators.Include(s => s.User).ToListAsync();
            return Ok(result);
        }


        [HttpPut("update")]
        public async Task<IActionResult> update(RegisterAdminDTO res)
        {
            var userEdit = new User
            {
                UserID = res.UserID,
                Username = res.Username,
                FullName = res.FullName,
                Email = res.Email,
                PhoneNumber = res.PhoneNumber,
                Password = res.Password,
                ProfilePicture = res.ProfilePicture,
                DateOfBirth = res.DateOfBirth,
                Country = res.Country,
                Address = res.Address,
                AccountStatus = res.AccountStatus,
                CreatedAt = res.CreatedAt,
                Status = res.Status,
                TypeUser = res.TypeUser,
                Gender = res.Gender
            };
            _dbContext.Entry(userEdit).State = EntityState.Modified;
            var admin = await _dbContext.Administrators.FirstOrDefaultAsync(s => s.UserID == res.UserID);
            admin!.RoleID = res.roleID;
            bool check = await _dbContext.SaveChangesAsync() > 0;
            return check ? Ok("Success") : BadRequest();


        }


        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] Dictionary<string, string> request)
        {
            // Kiểm tra dữ liệu
            if (!request.ContainsKey("username") || !request.ContainsKey("password"))
            {
                return BadRequest("Dữ liệu không hợp lệ: Thiếu username hoặc password.");
            }

            var username = request["username"];
            var password = request["password"];

            // Gọi dịch vụ để xử lý đăng nhập
            var admin = await _userService.loginAdmin(username, password);
            if (admin == null)
            {
                return NotFound("Không tồn tại tài khoản nào như vậy.");
            }
            admin.menus = await getMenuByRole(admin.roleID);
            return Ok(admin);
        }

        private async Task<List<Menu>> getMenuByRole(string roleID)
        {
            // Truy vấn bảng Role để lấy Permission (danh sách menuID trong Role)
            var role = await _dbContext.Roles
                .Where(r => r.RoleID == roleID)
                .FirstOrDefaultAsync();

            if (role == null || string.IsNullOrEmpty(role.Permission))
            {
                return new List<Menu>(); // Trả về danh sách rỗng nếu không có quyền hoặc permission không hợp lệ
            }

            // Giải mã chuỗi JSON thành danh sách MenuID
            var menuIDs = JsonSerializer.Deserialize<List<int>>(role.Permission);

            if (menuIDs == null || !menuIDs.Any())
            {
                return new List<Menu>(); // Trả về danh sách rỗng nếu không có MenuID
            }

            // Lấy tất cả các menu mà role này có quyền
            var allMenus = await _dbContext.Menus.OrderBy(s => s.Sort??int.MaxValue)
                .Where(m => menuIDs.Contains(m.MenuID.Value))
                .ToListAsync();

            // Gộp nhóm menu con vào menu cha
            var rootMenus = allMenus.Where(m => m.ParentMenuID == null).OrderBy(s=>s.Sort).ToList();

            foreach (var rootMenu in rootMenus)
            {
                // Tìm các menu con của menu cha
                var children = allMenus.Where(m => m.ParentMenuID == rootMenu.MenuID).ToList();
                if (children.Any())
                {
                    rootMenu.children = children;
                }
            }

            return rootMenus;
        }

        [HttpPost("insertAdmin")]
        public async Task<IActionResult> inserAdmin([FromBody] RegisterAdminDTO model)
        {
            if (model == null)
            {
                return BadRequest("Cần nhập dữ liệu hợp lệ");
            }
            var createStatus = await _userService.addAdmin(model);

            return createStatus ? Ok("Tạo thành công tài khoản admin") : BadRequest(createStatus);

        }
    }
}
