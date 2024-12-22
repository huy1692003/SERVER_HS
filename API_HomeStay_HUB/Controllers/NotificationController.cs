using API_HomeStay_HUB.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotificationController : ControllerBase
    {
        private readonly DBContext db;
        public NotificationController(DBContext db)
        {
            this.db = db;
        }

        [HttpGet("getByUser/{id}")]
        public async Task<IActionResult> getNotificationByUser(string id)
        {
            return Ok(await db.Notifications.Where(s => s.UserID == id).OrderByDescending(s=>s.CreatedAt).ToListAsync());
        }

        [HttpPut("isRead/{id}")]
        public async Task<IActionResult> updateIsRead(int id)
        {
            var notification = await db.Notifications.FirstOrDefaultAsync(s => s.Id == id);
            if (notification != null)
            {
                notification.IsRead = true;
                await db.SaveChangesAsync();

            }
            return NoContent();
        }

        [HttpPut("delete/{id}")]
        public async Task<IActionResult> deleteNotification(int id)
        {
            var notification = await db.Notifications.FirstOrDefaultAsync(s => s.Id == id);
            if (notification != null)
            {
                db.Notifications.Remove(notification);
                await db.SaveChangesAsync();

            }
            return NoContent();
        }
    }
}
