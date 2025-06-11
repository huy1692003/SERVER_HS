using API_HomeStay_HUB.Realtime;
using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Helpers;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Interfaces;
using API_HomeStay_HUB.Services;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using API_HomeStay_HUB.DTOs;
using Newtonsoft.Json;

namespace API_HomeStay_HUB.Repositories
{

    public enum EmailType { Success, Failed, Confirmed, Cancelled }

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
            var roomIds = booking.DetailBooking.Select(r => r.RoomId).ToList();
            var rooms = await _dbContext.Rooms
                .Where(s => s.HomestayId == booking.HomeStayID && roomIds.Contains(s.RoomId))
                .ToListAsync();

            foreach (var room in rooms)
                room.convertStringToHiddenDates();

            if (!await checkDateExitedBooking(booking.HomeStayID!, rooms, booking.CheckInDate!, booking.CheckOutDate!))
            {
                booking.status = 1;
                booking.BookingTime = TimeHelper.GetDateTimeVietnam();
                booking.DetailBookingString = JsonConvert.SerializeObject(booking.DetailBooking);
                var entity = await _dbContext.AddAsync(booking);
                bool check = await _dbContext.SaveChangesAsync() > 0;

                if (check)
                {
                    foreach (Room room in rooms)
                        await updateBookingDatesToRoom(room, booking.CheckInDate!, booking.CheckOutDate!, true);

                    await _hub.Clients.All.SendAsync("RefeshDateHomeStay", booking.HomeStayID);
                    _ = await SendBookingEmail(entity.Entity, EmailType.Success);

                    if (booking.isOwnerCreated)
                        return await confirmBooking(entity.Entity.BookingID);
                }
                return check;
            }
            else
            {
                _ = await SendBookingEmail(booking, EmailType.Failed, "Phòng đã được đặt trong thời gian này");
                return false;
            }
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
                    await _dbContext.BookingProcesses.AddAsync(new BookingProcess { BookingID = idBooking, StepOrder = 0 });
                    bool checkConfirm = await _dbContext.SaveChangesAsync() > 0;
                    if (checkConfirm)
                        return await SendBookingEmail(booking, EmailType.Confirmed);
                }
                return false;
            }
            catch { return false; }
        }

        public async Task<bool> cancelBooking(int idBooking, string reasonCancel)
        {
            try
            {
                var booking = await _dbContext.Bookings.FirstOrDefaultAsync(s => s.BookingID == idBooking);
                booking.DetailBooking = JsonConvert.DeserializeObject<List<DetailBooking>>(booking.DetailBookingString);
                var roomIds = booking.DetailBooking.Select(r => r.RoomId).ToList();
                var rooms = await _dbContext.Rooms
                    .Where(s => s.HomestayId == booking.HomeStayID && roomIds.Contains(s.RoomId))
                    .ToListAsync();

                if (booking != null)
                {
                    booking.IsCancel = true;
                    booking.status = -1;
                    booking.ReasonCancel = reasonCancel;
                    bool checkCancel = await _dbContext.SaveChangesAsync() > 0;

                    if (checkCancel)
                    {
                        foreach (var room in rooms)
                        {
                            room.convertStringToHiddenDates();
                            await updateBookingDatesToRoom(room, booking.CheckInDate, booking.CheckOutDate, false);
                        }
                        await _hub.Clients.All.SendAsync("RefeshDateHomeStay", booking.HomeStayID);
                        _ = await SendBookingEmail(booking, EmailType.Cancelled);
                    }
                    return true;
                }
                return false;
            }
            catch { return false; }
        }

        #region Email System

        private async Task<bool> SendBookingEmail(Booking booking, EmailType type, string? reason = null)
        {
            try
            {
                var homeStay = await _dbContext.HomeStays.FirstOrDefaultAsync(s => s.HomestayID == booking.HomeStayID);
                if (homeStay == null) return false;

                var (subject, body) = await GenerateEmailContent(booking, homeStay, type, reason);
                var sendMailService = new SendMaillService();
                _ = sendMailService.SendMaill(booking.Email!, subject, body);
                return true;
            }
            catch { return false; }
        }

        private async Task<(string subject, string body)> GenerateEmailContent(Booking booking, HomeStay homeStay, EmailType type, string? reason)
        {
            var address = $"{homeStay.AddressDetail}, {homeStay.WardOrCommune}, {homeStay.District}, {homeStay.Province}";
            var checkIn = booking.CheckInDate.ToString("dd/MM/yyyy") ?? "N/A";
            var checkOut = booking.CheckOutDate.ToString("dd/MM/yyyy") ?? "N/A";
            var roomDetails = await GetRoomDetails(booking);

            return type switch
            {
                EmailType.Success => GenerateSuccessEmail(booking, homeStay, address, checkIn, checkOut, roomDetails),
                EmailType.Failed => GenerateFailedEmail(booking, homeStay, address, checkIn, checkOut, reason),
                EmailType.Confirmed => await GenerateConfirmedEmail(booking, homeStay, address, checkIn, checkOut, roomDetails),
                EmailType.Cancelled => GenerateCancelledEmail(booking, homeStay, address, checkIn, checkOut, booking.ReasonCancel),
                _ => ("", "")
            };
        }

        private async Task<string> GetRoomDetails(Booking booking)
        {
            if (booking.DetailBooking == null && !string.IsNullOrEmpty(booking.DetailBookingString))
                booking.DetailBooking = JsonConvert.DeserializeObject<List<DetailBooking>>(booking.DetailBookingString);

            if (booking.DetailBooking?.Any() != true) return "";

            var details = new List<string>();
            foreach (var detail in booking.DetailBooking)
            {
                var room = await _dbContext.Rooms.FirstOrDefaultAsync(r => r.RoomId == detail.RoomId);
                var roomName = room?.RoomName ?? $"Phòng #{detail.RoomId}";
                details.Add($"- {roomName}: {detail.PricePerNight:C}/đêm");
            }
            return string.Join("<br/>", details);
        }

        private (string, string) GenerateSuccessEmail(Booking booking, HomeStay homeStay, string address, string checkIn, string checkOut, string roomDetails)
        {
            return ("Đặt phòng thành công - Chờ xác nhận", $@"
                <div style='font-family: Arial; max-width: 600px; margin: 0 auto;'>
                    <h2 style='color: #28a745;'>Xin chào {booking.Name},</h2>
                    <p>Đặt phòng tại <b>{homeStay.HomestayName}</b> thành công! Đang chờ xác nhận từ chủ nhà.</p>
                    <div style='background: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;'>
                        <h3>Thông tin đặt phòng:</h3>
                        <p><b>Mã:</b> #{booking.BookingID}</p>
                        <p><b>Homestay:</b> {homeStay.HomestayName}</p>
                        <p><b>Địa chỉ:</b> {address}</p>
                        <p><b>Check-in:</b> {checkIn} | <b>Check-out:</b> {checkOut}</p>
                        <p><b>Phòng:</b><br/>{roomDetails}</p>
                        <p><b>Tổng tiền:</b> <span style='color: #dc3545; font-weight: bold;'>{booking.TotalPrice:C}</span></p>
                    </div>
                    <div style='background: #fff3cd; padding: 15px; border-radius: 5px;'>
                        <b>Lưu ý:</b> Đơn đang chờ xác nhận. Chúng tôi sẽ thông báo khi có phản hồi.
                    </div>
                    <hr/><p>Trân trọng,<br/><b>HomeStay HUB</b></p>
                </div>");
        }

        private (string, string) GenerateFailedEmail(Booking booking, HomeStay homeStay, string address, string checkIn, string checkOut, string? reason)
        {
            return ("Đặt phòng không thành công", $@"
                <div style='font-family: Arial; max-width: 600px; margin: 0 auto;'>
                    <h2 style='color: #dc3545;'>Xin chào {booking.Name},</h2>
                    <p>Rất tiếc, đặt phòng tại <b>{homeStay.HomestayName}</b> không thành công.</p>
                    <div style='background: #f8f9fa; padding: 20px; border-radius: 8px;'>
                        <p><b>Homestay:</b> {homeStay.HomestayName}</p>
                        <p><b>Địa chỉ:</b> {address}</p>
                        <p><b>Thời gian:</b> {checkIn} - {checkOut}</p>
                    </div>
                    <div style='background: #f8d7da; padding: 15px; border-radius: 5px; margin: 20px 0;'>
                        <b>Lý do:</b> {reason ?? "Phòng không còn trống trong thời gian này"}
                    </div>
                    <p>Vui lòng thử đặt ngày khác hoặc tìm homestay khác.</p>
                    <hr/><p>Trân trọng,<br/><b>HomeStay HUB</b></p>
                </div>");
        }

        private async Task<(string, string)> GenerateConfirmedEmail(Booking booking, HomeStay homeStay, string address, string checkIn, string checkOut, string roomDetails)
        {
            var ownerInfo = await _dbContext.OwnerStays
                .Join(_dbContext.Users, o => o.UserID, u => u.UserID, (o, u) => new { o.OwnerID, u.FullName, u.PhoneNumber })
                .FirstOrDefaultAsync(x => x.OwnerID == booking.OwnerID);

            var ownerContact = ownerInfo != null ? $"<p><b>Liên hệ chủ nhà:</b> {ownerInfo.FullName} - {ownerInfo.PhoneNumber}</p>" : "";

            return ("🎉 Đặt phòng đã xác nhận - Chuẩn bị đi thôi!", $@"
                <div style='font-family: Arial; max-width: 600px; margin: 0 auto;'>
                    <h2 style='color: #28a745;'>🎉 Xin chào {booking.Name},</h2>
                    <p><b>Chúc mừng!</b> Đặt phòng tại <b>{homeStay.HomestayName}</b> đã được xác nhận!</p>
                    <div style='background: #d4edda; padding: 20px; border-radius: 8px; margin: 20px 0;'>
                        <h3>Thông tin xác nhận:</h3>
                        <p><b>Homestay:</b> {homeStay.HomestayName}</p>
                        <p><b>Địa chỉ:</b> {address}</p>
                        <p><b>Check-in:</b> {checkIn} | <b>Check-out:</b> {checkOut}</p>
                        <p><b>Phòng:</b><br/>{roomDetails}</p>
                        <p><b>Tổng tiền phòng thanh toán:</b> <span style='color: #dc3545; font-weight: bold;'>{booking.TotalPrice:C}</span></p>
                        <p><b>Xác nhận lúc:</b> {booking.TimeConfirm?.ToString("dd/MM/yyyy HH:mm")}</p>
                    </div>
                    <div style='background: #fff3cd; padding: 15px; border-radius: 5px; text-align: center; margin: 20px 0;'>
                        <p><b>Mã Check-in:</b></p>
                        <div style='background: white; padding: 15px; font-size: 24px; font-weight: bold; border: 2px dashed #ffc107; border-radius: 5px;'>
                            #{booking.BookingID}
                        </div>
                        <small>Xuất trình mã này khi check-in</small>
                    </div>
                    {ownerContact}
                    <p><b>📍 Vị trí:</b> <a href='{homeStay.LinkGoogleMap}'>Google Maps</a></p>
                    <div style='background: #f8f9fa; padding: 15px; border-radius: 5px;'>
                        <b>Lưu ý:</b> Đến đúng giờ, mang giấy tờ tùy thân, liên hệ chủ nhà nếu cần.
                    </div>
                    <p>Chúc bạn có chuyến đi tuyệt vời! 🌟</p>
                    <hr/><p>Trân trọng,<br/><b>HomeStay HUB</b></p>
                </div>");
        }

        private (string, string) GenerateCancelledEmail(Booking booking, HomeStay homeStay, string address, string checkIn, string checkOut, string? reason)
        {
            return ("Thông báo hủy đặt phòng", $@"
                <div style='font-family: Arial; max-width: 600px; margin: 0 auto;'>
                    <h2 style='color: #dc3545;'>Xin chào {booking.Name},</h2>
                    <p>Đặt phòng tại <b>{homeStay.HomestayName}</b> đã được hủy.</p>
                    <div style='background: #f8f9fa; padding: 20px; border-radius: 8px;'>
                        <p><b>Mã:</b> #{booking.BookingID}</p>
                        <p><b>Homestay:</b> {homeStay.HomestayName}</p>
                        <p><b>Thời gian:</b> {checkIn} - {checkOut}</p>
                        <p><b>Giá trị:</b> {booking.TotalPrice:C}</p>
                    </div>
                    <div style='background: #f8d7da; padding: 15px; border-radius: 5px; margin: 20px 0;'>
                        <b>Lý do hủy:</b> {reason ?? "Không có thông tin"}
                    </div>
                    <div style='background: #d1ecf1; padding: 15px; border-radius: 5px;'>
                        <b>Hoàn tiền:</b> Chúng tôi sẽ xử lý hoàn tiền theo chính sách. Vui lòng liên hệ để biết chi tiết.
                    </div>
                    <p>Bạn có thể tìm homestay khác hoặc đặt lại với ngày khác.</p>
                    <hr/><p>Trân trọng,<br/><b>HomeStay HUB</b></p>
                </div>");
        }

        #endregion

        #region Original Methods (kept unchanged)

        public async Task<bool> checkDateExitedBooking(int? idHomestay, List<Room>? rooms, DateTime? dateIn, DateTime? dateOut)
        {
            if (idHomestay == null || dateIn == null || dateOut == null || rooms == null || rooms.Count < 1)
                return false;

            var roomIdsInBooking = rooms.Select(d => d.RoomId).Distinct().ToList();
            var relevantRooms = rooms.Where(r => roomIdsInBooking.Contains(r.RoomId)).ToList();

            foreach (var room in relevantRooms)
            {
                if (HasDateConflict(room, dateIn.Value, dateOut.Value))
                    return true;
            }
            return false;
        }

        private bool HasDateConflict(Room room, DateTime dateIn, DateTime dateOut)
        {
            if (room.RoomHiddenDates == null || room.RoomHiddenDates.Count < 1) return false;

            var current = dateIn;
            while (current <= dateOut)
            {
                foreach (var yearData in room.RoomHiddenDates)
                {
                    if (yearData.year == current.Year)
                    {
                        foreach (var monthData in yearData.months)
                        {
                            if (monthData.month == current.Month)
                            {
                                if (monthData.hiddenDays.Contains(current.Day))
                                    return true;
                            }
                        }
                    }
                }
                current = current.AddDays(1);
            }
            return false;
        }

        private async Task<bool> updateBookingDatesToRoom(Room room, DateTime dateIn, DateTime dateOut, bool isAdd)
        {
            if (room.RoomHiddenDates == null || room.RoomHiddenDates.Count < 1)
                room.RoomHiddenDates = new List<YearDateHideForRoomDTO>();

            var current = dateIn;
            while (current <= dateOut)
            {
                if (isAdd)
                    AddDateToHidden(room, current);
                else
                    RemoveDateFromHidden(room, current);
                current = current.AddDays(1);
            }

            room.DateHide = JsonConvert.SerializeObject(room.RoomHiddenDates);
            _dbContext.Rooms.Update(room);
            return await _dbContext.SaveChangesAsync() > 0;
        }

        private void AddDateToHidden(Room room, DateTime date)
        {
            var yearData = room.RoomHiddenDates.FirstOrDefault(y => y.year == date.Year);
            if (yearData == null)
            {
                yearData = new YearDateHideForRoomDTO { year = date.Year, months = new List<MonthsDTO>() };
                room.RoomHiddenDates.Add(yearData);
            }

            var monthData = yearData.months.FirstOrDefault(m => m.month == date.Month);
            if (monthData == null)
            {
                monthData = new MonthsDTO { month = date.Month, hiddenDays = new List<int>() };
                yearData.months.Add(monthData);
            }

            if (!monthData.hiddenDays.Contains(date.Day))
                monthData.hiddenDays.Add(date.Day);
        }

        private void RemoveDateFromHidden(Room room, DateTime date)
        {
            var yearData = room.RoomHiddenDates.FirstOrDefault(y => y.year == date.Year);
            if (yearData != null)
            {
                var monthData = yearData.months.FirstOrDefault(m => m.month == date.Month);
                if (monthData != null)
                {
                    monthData.hiddenDays.Remove(date.Day);
                    if (monthData.hiddenDays.Count == 0)
                        yearData.months.Remove(monthData);
                }
                if (yearData.months.Count == 0)
                    room.RoomHiddenDates.Remove(yearData);
            }
        }

        #endregion
    }
}
