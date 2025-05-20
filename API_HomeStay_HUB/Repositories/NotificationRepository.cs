using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Repositories
{
    public class NotificationRepository:INotificationRepository
    {
        private readonly DBContext db;
        public NotificationRepository(DBContext db)
        {
            this.db = db;
        }
        public async Task<IEnumerable<Notification>> Get_NotificationsByUserId(string userId)
        {
            return await db.Notifications.Where(s => s.UserID == userId).OrderByDescending(s => s.CreatedAt).ToListAsync();
        }

        public async Task<bool> UpdateIsRead(int notificationId)
        {
            var notification = await db.Notifications.FirstOrDefaultAsync(s => s.Id == notificationId);
            if (notification != null)
            {
                notification.IsRead = true;
                await db.SaveChangesAsync();

            }
            return true;
        }

        public async Task<bool> Delete_Notification(int notificationId)
        {
            var notification = await db.Notifications.FirstOrDefaultAsync(s => s.Id == notificationId);
            if (notification != null)
            {
                db.Notifications.Remove(notification);
                await db.SaveChangesAsync();
            }
            return true;
        }

        public async Task<Notification> Add_Notification(Notification notification)
        {
            await db.Notifications.AddAsync(notification);
            await db.SaveChangesAsync();
            return notification;
        }
    }
}
