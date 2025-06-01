using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SettingController : ControllerBase
    {
        private readonly DBContext _context;
        public SettingController(DBContext db)
        {
            _context = db;
        }

        // GET: api/Setting
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Setting>>> GetSettings()
        {
            return await _context.Settings.Where(s => s.IsActive == true).ToListAsync();
        }

        // GET: api/Setting/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Setting>> GetSetting(int id)
        {
            var setting = await _context.Settings.FindAsync(id);

            if (setting == null)
            {
                return NotFound();
            }

            return setting;
        }

        // GET: api/Setting/key/{key}
        [HttpGet("key/{key}")]
        public async Task<ActionResult<Setting>> GetSettingByKey(string key)
        {
            var setting = await _context.Settings.FirstOrDefaultAsync(s => s.Key == key && s.IsActive == true);

            if (setting == null)
            {
                return NotFound();
            }

            return setting;
        }

        // POST: api/Setting
        [HttpPost]
        public async Task<ActionResult<Setting>> CreateSetting(Setting setting)
        {
            try
            {
                setting.CreatedAt = DateTime.Now;
                _context.Settings.Add(setting);
                await _context.SaveChangesAsync();

                return CreatedAtAction(nameof(GetSetting), new { id = setting.Id }, setting);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = ex.Message });
            }
        }

        // PUT: api/Setting/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateSetting(int id, Setting setting)
        {
            if (id != setting.Id)
            {
                return BadRequest();
            }

            try
            {
                setting.UpdatedAt = DateTime.Now;
                _context.Entry(setting).State = EntityState.Modified;
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SettingExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // DELETE: api/Setting/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSetting(int id)
        {
            var setting = await _context.Settings.FindAsync(id);
            if (setting == null)
            {
                return NotFound();
            }

            setting.IsActive = false;
            setting.UpdatedAt = DateTime.Now;
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool SettingExists(int id)
        {
            return _context.Settings.Any(e => e.Id == id);
        }
    }
}
