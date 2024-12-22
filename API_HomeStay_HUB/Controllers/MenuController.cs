using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    
    public class MenuController : ControllerBase
    {
        private readonly DBContext db;

        public MenuController(DBContext db)
        {
            this.db = db;
        }

        // GET: api/Menu
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Menu>>> GetMenus()
        {
            var menus = await db.Menus.ToListAsync();
            return Ok(menus);
        }

        // GET: api/Menu/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Menu>> GetMenu(int id)
        {
            var menu = await db.Menus.FindAsync(id);
            if (menu == null)
            {
                return NotFound();
            }
            return Ok(menu);
        }

        // POST: api/Menu
        [HttpPost]
        public async Task<ActionResult<Menu>> CreateMenu(Menu menu)
        {
            if (menu == null)
            {
                return BadRequest("Menu cannot be null.");
            }

            db.Menus.Add(menu);
            await db.SaveChangesAsync();

            return CreatedAtAction(nameof(GetMenu), new { id = menu.MenuID }, menu);
        }

        // PUT: api/Menu/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateMenu(int id, Menu menu)
        {
            if (id != menu.MenuID)
            {
                return BadRequest("Menu ID mismatch.");
            }

            db.Entry(menu).State = EntityState.Modified;
            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MenuExists(id))
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

        // DELETE: api/Menu/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMenu(int id)
        {
            var menu = await db.Menus.FindAsync(id);
            if (menu == null)
            {
                return NotFound();
            }

            db.Menus.Remove(menu);
            await db.SaveChangesAsync();

            return NoContent();
        }

        private bool MenuExists(int id)
        {
            return db.Menus.Any(e => e.MenuID == id);
        }
    }
}
