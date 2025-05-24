using System.Text;
using API_HomeStay_HUB.Helpers;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Realtime;
using API_HomeStay_HUB.Repositories;
using API_HomeStay_HUB.Repositories.Intefaces;
using API_HomeStay_HUB.Repositories.Interfaces;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.SignalR;

namespace API_HomeStay_HUB.Services
{
    public class BookingService : IBookingService
    {
        private readonly IBookingRepository _bookingRepository;
        private readonly ISendMaillService _sendMaillService;
        private readonly IHubContext<MyHub> _hub;
        private readonly IHomeStayRepository _homestayRepository;
        private readonly INotificationRepository _notificationRepository;
        private readonly IUserRepository _userRepository;

        public BookingService(IBookingRepository bookingRepository, ISendMaillService sendM,IHubContext<MyHub>_hub,INotificationRepository no, IUserRepository userRepository, IHomeStayRepository homeStayRepository)
        {
            this._bookingRepository = bookingRepository;
            this._sendMaillService = sendM;
            this._hub = _hub;
            this._notificationRepository = no;
            this._userRepository = userRepository;
            this._homestayRepository = homeStayRepository;
        }
        
        public async Task<bool> createBooking(Booking booking)
        {
           
            var checkCreated = await _bookingRepository.createBooking(booking);
            if(checkCreated)
            {
                await _hub.Clients.All.SendAsync("RefeshDateHomeStay", booking.HomeStayID); //Gửi tín hiểu reload lại những ngày đã đặt
                var Owner = await _userRepository.GetDetailOwnerStay(booking.OwnerID!);
                var notification = new Notification
                {

                    UserID = Owner.UserID!,
                    Title = "Thông báo đơn đặt phòng mới",
                    Message = $"Homestay có mã #{booking.HomeStayID} vừa có khách hàng mới đã đặt phòng vào " + TimeHelper.formatDateVN(booking.BookingTime),
                    CreatedAt = TimeHelper.GetDateTimeVietnam(),
                    IsRead = false,
                    Type = "success"
                };
                await _notificationRepository.Add_Notification(notification);
                await _hub.Clients.All.SendAsync("ReseiverBookingNew", booking.OwnerID, notification);// Gửi thông báo đến Chủ Homstay
                await SendEmailToHomestayOwner(booking, Owner.User!.Email!);
                return true;


            }
            return false;

        }
        public async Task<bool> confirmBooking(int idBooking)
        {
            return await _bookingRepository.confirmBooking(idBooking);  
        }
        public async Task<bool> cancelBooking(int idBooking, string reasonCancel)
        {
            return await _bookingRepository.cancelBooking(idBooking, reasonCancel);
        }
        public async Task<IEnumerable<dynamic>> getBookingDates(int idHomeStay)
        {
            return await _bookingRepository.getBookingDates(idHomeStay);
        }

        private async Task SendEmailToHomestayOwner(Booking booking, string EmailOwner)
        {
            try
            {


                // Lấy thông tin homestay
                var homestay = await _homestayRepository.getHomeStayByID(booking.HomeStayID ?? 0);

                // Tạo tiêu đề email
                string titleSendMail = $"Thông báo: Đơn đặt phòng mới cho Homestay {homestay!.HomeStay!.HomestayName}";

                // Tạo nội dung email với nút chấp nhận và từ chối
                string content = GenerateBookingEmailContent(booking, homestay!.HomeStay!.HomestayName ?? "Homestay");

                // Gửi email
                await _sendMaillService.SendMaill(EmailOwner, titleSendMail, content);

                return;
            }
            catch (Exception ex)
            {
                // Log exception
                Console.WriteLine($"Error sending email to homestay owner: {ex.Message}");
                return;
            }
        }
        private string GenerateBookingEmailContent(Booking booking, string homestayName)
        {
            string urlClientReject = "http://localhost:3000/booking-action";
            // Tạo URL cho các nút hành động (cần thay thế bằng URL thực của ứng dụng)
            string confirmUrl = urlClientReject + "?action=confirm&id=" + booking.BookingID;
            string rejectUrl = urlClientReject + "?action=reject&id=" + booking.BookingID;


            // Tính số ngày lưu trú
            int stayDays = (int)(booking.CheckOutDate - booking.CheckInDate).TotalDays;
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<!DOCTYPE html>");
            sb.AppendLine("<html>");
            sb.AppendLine("<head>");
            sb.AppendLine("    <meta charset='UTF-8'>");
            sb.AppendLine("    <meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            sb.AppendLine("    <title>Đơn đặt phòng mới</title>");
            sb.AppendLine("    <style>");
            sb.AppendLine("        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }");
            sb.AppendLine("        .container { max-width: 600px; margin: 0 auto; padding: 20px; }");
            sb.AppendLine("        .header { background-color: #4CAF50; color: white; padding: 10px; text-align: center; }");
            sb.AppendLine("        .booking-details { background-color: #f9f9f9; padding: 15px; margin: 15px 0; border-radius: 5px; }");
            sb.AppendLine("        .booking-row { display: flex; justify-content: space-between; margin-bottom: 10px; }");
            sb.AppendLine("        .booking-label { font-weight: bold; width: 40%; }");
            sb.AppendLine("        .booking-value { width: 60%; }");
            sb.AppendLine("        .buttons { display: flex; justify-content: space-between; margin-top: 20px; }");
            sb.AppendLine("        .button { display: inline-block; padding: 10px 20px; text-decoration: none; color: white; border-radius: 5px; text-align: center; font-weight: bold; }");
            sb.AppendLine("        .accept { background-color: #4CAF50; }");
            sb.AppendLine("        .reject { background-color: #f44336; }");
            sb.AppendLine("        .footer { margin-top: 20px; font-size: 12px; color: #777; text-align: center; }");
            sb.AppendLine("    </style>");
            sb.AppendLine("</head>");
            sb.AppendLine("<body>");
            sb.AppendLine("    <div class='container'>");
            sb.AppendLine("        <div class='header'>");
            sb.AppendLine($"            <h2>Đơn đặt phòng mới cho {homestayName}</h2>");
            sb.AppendLine("        </div>");

            sb.AppendLine("        <p>Kính gửi chủ Homestay,</p>");
            sb.AppendLine("        <p>Bạn vừa nhận được một đơn đặt phòng mới với thông tin chi tiết như sau:</p>");

            sb.AppendLine("        <div class='booking-details'>");
            sb.AppendLine("            <div class='booking-row'>");
            sb.AppendLine("                <div class='booking-label'>Mã đơn đặt:</div>");
            sb.AppendLine($"                <div class='booking-value'>{booking.BookingID}</div>");
            sb.AppendLine("            </div>");
            sb.AppendLine("            <div class='booking-row'>");
            sb.AppendLine("                <div class='booking-label'>Tên khách hàng:</div>");
            sb.AppendLine($"                <div class='booking-value'>{booking.Name}</div>");
            sb.AppendLine("            </div>");
            sb.AppendLine("            <div class='booking-row'>");
            sb.AppendLine("                <div class='booking-label'>Email:</div>");
            sb.AppendLine($"                <div class='booking-value'>{booking.Email}</div>");
            sb.AppendLine("            </div>");
            sb.AppendLine("            <div class='booking-row'>");
            sb.AppendLine("                <div class='booking-label'>Số điện thoại:</div>");
            sb.AppendLine($"                <div class='booking-value'>{booking.Phone}</div>");
            sb.AppendLine("            </div>");
            sb.AppendLine("            <div class='booking-row'>");
            sb.AppendLine("                <div class='booking-label'>Ngày nhận phòng:</div>");
            sb.AppendLine($"                <div class='booking-value'>{TimeHelper.formatDateVN(booking.CheckInDate)}</div>");
            sb.AppendLine("            </div>");
            sb.AppendLine("            <div class='booking-row'>");
            sb.AppendLine("                <div class='booking-label'>Ngày trả phòng:</div>");
            sb.AppendLine($"                <div class='booking-value'>{TimeHelper.formatDateVN(booking.CheckOutDate)}</div>");
            sb.AppendLine("            </div>");
            sb.AppendLine("            <div class='booking-row'>");
            sb.AppendLine("                <div class='booking-label'>Số đêm:</div>");
            sb.AppendLine($"                <div class='booking-value'>{stayDays}</div>");
            sb.AppendLine("            </div>");
            sb.AppendLine("            <div class='booking-row'>");
            sb.AppendLine("                <div class='booking-label'>Số lượng người lớn:</div>");
            sb.AppendLine($"                <div class='booking-value'>{booking.NumberAdults}</div>");
            sb.AppendLine("            </div>");
            sb.AppendLine("            <div class='booking-row'>");
            sb.AppendLine("                <div class='booking-label'>Số lượng trẻ em:</div>");
            sb.AppendLine($"                <div class='booking-value'>{booking.NumberChildren}</div>");
            sb.AppendLine("            </div>");
            sb.AppendLine("            <div class='booking-row'>");
            sb.AppendLine("                <div class='booking-label'>Số lượng em bé:</div>");
            sb.AppendLine($"                <div class='booking-value'>{booking.NumberBaby}</div>");
            sb.AppendLine("            </div>");

            // Hiển thị thông tin giá nếu có
            if (booking.OriginalPrice.HasValue)
            {
                sb.AppendLine("            <div class='booking-row'>");
                sb.AppendLine("                <div class='booking-label'>Giá gốc:</div>");
                sb.AppendLine($"                <div class='booking-value'>{string.Format("{0:N0} VNĐ", booking.OriginalPrice)}</div>");
                sb.AppendLine("            </div>");
            }

            if (!string.IsNullOrEmpty(booking.DiscountCode))
            {
                sb.AppendLine("            <div class='booking-row'>");
                sb.AppendLine("                <div class='booking-label'>Mã giảm giá:</div>");
                sb.AppendLine($"                <div class='booking-value'>{booking.DiscountCode}</div>");
                sb.AppendLine("            </div>");

                if (booking.DiscountPrice.HasValue)
                {
                    sb.AppendLine("            <div class='booking-row'>");
                    sb.AppendLine("                <div class='booking-label'>Giảm giá:</div>");
                    sb.AppendLine($"                <div class='booking-value'>{string.Format("{0:N0} VNĐ", booking.DiscountPrice)}</div>");
                    sb.AppendLine("            </div>");
                }
            }

            sb.AppendLine("            <div class='booking-row'>");
            sb.AppendLine("                <div class='booking-label'>Tổng tiền:</div>");
            sb.AppendLine($"                <div class='booking-value'><strong>{string.Format("{0:N0} VNĐ", booking.TotalPrice)}</strong></div>");
            sb.AppendLine("            </div>");

            if (!string.IsNullOrEmpty(booking.Description))
            {
                sb.AppendLine("            <div class='booking-row'>");
                sb.AppendLine("                <div class='booking-label'>Ghi chú:</div>");
                sb.AppendLine($"                <div class='booking-value'>{booking.Description}</div>");
                sb.AppendLine("            </div>");
            }

            sb.AppendLine("        </div>");

            sb.AppendLine("        <p>Vui lòng xác nhận hoặc từ chối đơn đặt phòng này bằng cách nhấn vào các nút bên dưới:</p>");

            sb.AppendLine("        <div class='buttons'>");
            sb.AppendLine($"            <a href='{confirmUrl}' class='button accept' style='margin-right:10px' >Chấp nhận đơn</a>");
            sb.AppendLine($"            <a href='{rejectUrl}' class='button reject'>Từ chối đơn</a>");
            sb.AppendLine("        </div>");

            sb.AppendLine("        <p>Nếu bạn không thực hiện hành động trong vòng 24 giờ, đơn đặt phòng có thể bị hủy tự động.</p>");

            sb.AppendLine("        <div class='footer'>");
            sb.AppendLine("            <p>Email này được gửi tự động từ hệ thống HomeStay HUB. Vui lòng không trả lời email này.</p>");
            sb.AppendLine("            <p>© 2025 HomeStay HUB. Tất cả các quyền được bảo lưu.</p>");
            sb.AppendLine("        </div>");

            sb.AppendLine("    </div>");
            sb.AppendLine("</body>");
            sb.AppendLine("</html>");

            return sb.ToString();
        }


    }
}
