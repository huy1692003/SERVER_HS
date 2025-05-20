using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.Repositories.Interfaces
{
    public interface INotificationRepository
    {
        
        Task<IEnumerable<Notification>> Get_NotificationsByUserId(string userId);
       
        Task<bool> UpdateIsRead(int notificationId);

        Task<bool> Delete_Notification(int notificationId);

        Task<Notification> Add_Notification(Notification notification);
    }
}
