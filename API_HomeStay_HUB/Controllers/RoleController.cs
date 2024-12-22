using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Text.Json;
using System.Threading.Tasks;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class RoleController : ControllerBase
    {
        private readonly IRoleService _roleService;
        private readonly DBContext dB;
        public RoleController(IRoleService roleService,DBContext db)
        {
            _roleService = roleService;
            this.dB = db;
        }

        // GET: api/role/getAll
        [HttpGet("getAll")]
        public async Task<ActionResult<IEnumerable<Role>>> GetAllRole()
        {
            var roles = await _roleService.GetAllRole();
            return Ok(roles);
        }

        // GET: api/role/getByID/{roleId}
        [HttpGet("getByID/{id}")]
        public async Task<IActionResult> GetRoleById(string id)
        {
            var role = await _roleService.GetRoleById(id);
            return role != null ? Ok(role) : NotFound();
        }

        // POST: api/role/create
        [HttpPost("create")]
        public async Task<IActionResult> AddRole([FromBody] Role role)
        {
            if (role == null)
            {
                return BadRequest("Không được để trống Role");
            }

            bool state = await _roleService.AddRole(role);
            return state ? CreatedAtAction(nameof(GetRoleById), new { id = role.RoleID }, role) : BadRequest("Dữ liệu Role không hợp lệ");
        }

        // PUT: api/role/update
        [HttpPut("update")]
        public async Task<IActionResult> UpdateRole([FromBody] Role role)
        {
            if (role == null || string.IsNullOrEmpty(role.RoleID))
            {
                return BadRequest("Role không được để trống");
            }

            bool state = await _roleService.UpdateRole(role);
            return state ? NoContent() : BadRequest("Dữ liệu Role không hợp lệ");
        }

        // PUT: api/role/update
        [HttpPut("grandMenu/{idRole}")]
        public async Task<IActionResult> grandMenu(string idRole,[FromBody] List<int> listMenus)
        {
            string menustring = JsonSerializer.Serialize(listMenus);
            var role = dB.Roles.FirstOrDefault(s=>s.RoleID==idRole);
            role.Permission = menustring;
            var check = dB.SaveChanges() > 0;
            return check ? Ok(role) : BadRequest();

        }

        // DELETE: api/role/delete/{roleId}
        [HttpDelete("delete/{roleId}")]
        public async Task<IActionResult> DeleteRole(string roleId)
        {
            bool state = await _roleService.DeleteRole(roleId);
            return state ? NoContent() : NotFound();

        }
    }
}
