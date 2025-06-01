using API_HomeStay_HUB.Realtime;
using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Helpers;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Interfaces;
using API_HomeStay_HUB.Services;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Repositories
{
    public class BookingRepository : IBookingRepository
    {
        private readonly DBContext _dbContext;
        private readonly IHubContext<MyHub> _hub;
        public BookingRepository(DBContext dBContext, IHubContext<MyHub> hub)
        {
            _dbContext = dBContext;
            _hub = hub;
        }

        public async Task<bool> createBooking(Booking booking)
        {


            if (!await checkDateExitedBooking(booking.HomeStayID!, booking.RoomID, booking.CheckInDate!, booking.CheckOutDate!))
            {
                booking.status = 1;
                booking.BookingTime = TimeHelper.GetDateTimeVietnam();

                var entity = await _dbContext.AddAsync(booking);
                bool check = await _dbContext.SaveChangesAsync() > 0;
                if (booking.isOwnerCreated)
                {
                    return await confirmBooking(entity.Entity.BookingID);
                }
                return check;
            }
            else
            {
                return false;
            }
        }

        public async Task<IEnumerable<dynamic>> getBookingDates(int idHomeStay, int idRoom)
        {
            return await _dbContext.Bookings.
                Where(b => b.HomeStayID == idHomeStay && b.RoomID == idRoom && b.CheckInDate >= DateTime.Now && ((!b.IsCancel && b.IsConfirm)) ).
                Select(b => new { b.CheckInDate, b.CheckOutDate }).ToListAsync();
        }


        public async Task<bool> confirmBooking(int idBooking)
        {
            try
            {
                var booking = await _dbContext.Bookings.FirstOrDefaultAsync(s => s.BookingID == idBooking);
                if (booking != null)
                {
                    booking.IsConfirm = true;
                    booking.status = 2;
                    booking.TimeConfirm = TimeHelper.GetDateTimeVietnam();
                    await _dbContext.BookingProcesses.AddAsync
                        (
                            new BookingProcess
                            {
                                BookingID = idBooking,

                                StepOrder = 0,


                            }
                        );
                    bool checkConfirm = await _dbContext.SaveChangesAsync() > 0;
                    if (checkConfirm)
                    {
                        await _hub.Clients.All.SendAsync("RefeshDateRoomHomeStay", booking.HomeStayID, booking.RoomID);
                        return await sendMaill_ConfirmBK(booking);
                        //Gửi tín hiệu cập nhật lịch phòng trống các homestay 


                    }
                }
                return false;
            }
            catch (Exception ex)
            {


                return false;
            }
        }

        public async Task<bool> sendMaill_ConfirmBK(Booking booking)
        {
            // Lấy thông tin homestay từ database
            var homeStay = await _dbContext.HomeStays.FirstOrDefaultAsync(s => s.HomestayID == booking.HomeStayID);
            if (homeStay == null)
            {
                Console.WriteLine("Homestay không tồn tại.");
                return false;
            }

            // Lấy thông tin khách hàng
            var emailUser = booking.Email;
            var nameUser = booking.Name;

            // Tiêu đề email
            string titleSendMail = "Thông báo đơn đặt phòng đã được xác nhận";
            var inforOwner = await _dbContext.OwnerStays.
                Join(_dbContext.Users,
                owner => owner.UserID,
                user => user.UserID,
                (owner, user) => new { Owner = owner, User = user }).FirstOrDefaultAsync(s => s.Owner.OwnerID == booking.OwnerID);

            // Nội dung email
            var content = $@"
                    <h2>Xin chào {nameUser},</h2>
                    <p>Chúc mừng bạn! Đơn đặt phòng của bạn tại <b>{homeStay.HomestayName}</b> đã được xác nhận thành công.</p>
                    <h3>Thông tin đặt phòng:</h3>
                    <ul>
                        <li><b>Địa chỉ Homestay:</b> {homeStay.AddressDetail}, {homeStay.WardOrCommune}, {homeStay.District}, {homeStay.Province}, {homeStay.Country}</li>
                        <li><b>Ngày nhận phòng:</b> {booking.CheckInDate.ToString("dd/MM/yyyy")}</li>
                        <li><b>Ngày trả phòng:</b> {booking.CheckOutDate.ToString("dd/MM/yyyy")}</li>
                        <li><b>Số lượng người lớn:</b> {booking.NumberAdults} người</li>
                        <li><b>Số lượng trẻ em:</b> {booking.NumberChildren} người</li>
                        <li><b>Số lượng em bé:</b> {booking.NumberBaby} người</li>
                        <li><b>Tổng giá trị:</b> {booking.TotalPrice:C}</li>
                        <li><b>Phương thức thanh toán:</b> {booking.PaymentMethod}</li>
                    </ul>
                    <p>Đây là mã Đặt Phòng đưa ra khi đến check in</p>
                    <div style='background-color: #f0f0f0; padding: 10px; border-radius: 5px;'>
                        <p>{booking.BookingID}</p>
                    </div>
                    <p>Để đảm bảo trải nghiệm tốt nhất, vui lòng đến đúng giờ nhận phòng và liên hệ với gia chủ nếu có bất kỳ yêu cầu đặc biệt nào.</p>
                    <p>Địa chỉ Homestay trên bản đồ: <a href='{homeStay.LinkGoogleMap}'>Xem trên Google Maps</a></p>
                    <p>Đây là thông tin của gia chủ bạn hãy liên hệ khi cần thiết :<span>{inforOwner.User.FullName}</span> - Số điện thoại :<span>{inforOwner.User.PhoneNumber}</span> </p>
                    <p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</p>
                    <p>Trân trọng,</p>
                    <p><b>Đội ngũ hỗ trợ HomeStay HUB</b></p>
                ";

            // Gửi email
            try
            {
                var sendMailService = new SendMaillService();
                _ = sendMailService.SendMaill(emailUser!, titleSendMail, content);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Gửi email thất bại: {ex.Message}");
                return false;
            }
        }

        public async Task<bool> sendMaill_CancelBK(Booking booking)
        {
            // Lấy thông tin homestay từ database
            var homeStay = await _dbContext.HomeStays.FirstOrDefaultAsync(s => s.HomestayID == booking.HomeStayID);
            if (homeStay == null)
            {
                Console.WriteLine("Homestay không tồn tại.");
                return false;
            }

            // Lấy thông tin khách hàng
            var emailUser = booking.Email;
            var nameUser = booking.Name;

            // Tiêu đề email
            string titleSendMail = "Thông báo đơn đặt phòng đã hủy";

            // Nội dung email
            var content = $@"
                    <h2>Xin chào {nameUser},</h2>
                    <p>Đơn đặt phòng của bạn tại <b>{homeStay.HomestayName}</b> đã được hủy.</p>
                    <h3>Thông tin đặt phòng đã hủy:</h3>
                    <ul>
                        <li><b>Địa chỉ Homestay:</b> {homeStay.AddressDetail}, {homeStay.WardOrCommune}, {homeStay.District}, {homeStay.Province}, {homeStay.Country}</li>
                        <li><b>Ngày nhận phòng:</b> {booking.CheckInDate.ToString("dd/MM/yyyy")}</li>
                        <li><b>Ngày trả phòng:</b> {booking.CheckOutDate.ToString("dd/MM/yyyy")}</li>
                        <li><b>Số lượng người lớn:</b> {booking.NumberAdults} người</li>
                        <li><b>Số lượng trẻ em:</b> {booking.NumberChildren} người</li>
                        <li><b>Số lượng em bé:</b> {booking.NumberBaby} người</li>
                        <li><b>Lý do hủy:</b> {booking.ReasonCancel}</li>
                    </ul>
                    <p>Nếu bạn có bất kỳ thắc mắc nào, vui lòng liên hệ với chúng tôi.</p>
                    <p>Trân trọng,</p>
                    <p><b>Đội ngũ hỗ trợ HomeStay HUB</b></p>
                ";

            // Gửi email
            try
            {
                var sendMailService = new SendMaillService();
                _ = sendMailService.SendMaill(emailUser!, titleSendMail, content);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Gửi email thất bại: {ex.Message}");
                return false;
            }
        }

        public async Task<bool> cancelBooking(int idBooking, string reasonCancel)
        {
            var booking = await _dbContext.Bookings.FirstOrDefaultAsync(s => s.BookingID == idBooking);
            if (booking != null)
            {
                booking.IsCancel = true;
                booking.status = -1;
                booking.ReasonCancel = reasonCancel;
                bool checkCancel = await _dbContext.SaveChangesAsync() > 0;
                if (checkCancel)
                {
                    return await sendMaill_CancelBK(booking);

                }
            }
            return false;
        }
        public async Task<bool> checkDateExitedBooking(int? idHomestay, int? idRoom, DateTime? dateIn, DateTime? dateOut)
        {
            var bookingByHomeStays = await _dbContext.Bookings
                .Where(bk => bk.HomeStayID == idHomestay && bk.RoomID == idRoom &&
                             dateIn <= bk.CheckOutDate && dateOut >= bk.CheckInDate && (!bk.IsCancel && bk.IsConfirm))
                .ToListAsync();

            return bookingByHomeStays.Any();
        }


    }
}
