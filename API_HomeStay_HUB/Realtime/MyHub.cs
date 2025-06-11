
using Microsoft.AspNetCore.SignalR;

namespace API_HomeStay_HUB.Realtime
{
    public class MyHub:Hub  {

        public async Task RefeshDateHomeStay(int idHomeStay)
        {
            // Gửi yêu cầu cập nhật lại thông tin các ngày đã đặt 
            await Clients.All.SendAsync("RefeshDateHomeStay", idHomeStay);
        }

        //Thông báo có đơn đặt phòng mới
        public async Task sendNotificationBookingNew(string owner)
        {
            // Gửi tin nhắn tới tất cả các client
            await Clients.All.SendAsync("ReseiverBookingNew", owner);
        }
    }
}
