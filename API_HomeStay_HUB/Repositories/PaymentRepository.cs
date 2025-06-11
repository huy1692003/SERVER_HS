using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Helpers;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Repositories
{
    public class PaymentRepository : IPaymentRepository
    {
        private readonly DBContext _dbContext;

        public PaymentRepository(DBContext dbContext)
        {
            _dbContext = dbContext;
        }



        public async Task<PagedResultDTO<dynamic>?> GetPayments(PaginateDTO paginate, int type, SearchPaymentDTO search)
        {
            var query = (from payment in _dbContext.Payments
                         join user in _dbContext.Users
                         on payment.UserID equals user.UserID into userGroup
                         from subUser in userGroup.DefaultIfEmpty()
                         join bk in _dbContext.Bookings
                         on payment.BookingID equals bk.BookingID into bkGroup
                         from subBk in bkGroup.DefaultIfEmpty()

                         where (
                              (type == 1 && string.IsNullOrEmpty(payment.OwnerID)) ||
                              (type == 2 && !string.IsNullOrEmpty(payment.OwnerID))
                              ) &&

                             (string.IsNullOrEmpty(search.UserName) || (subUser != null ? subUser.FullName.Contains(search.UserName) : subBk.Name.Contains(search.UserName))
                             && (string.IsNullOrEmpty(search.Email) || (subUser != null ? subUser.Email.Contains(search.Email) : subBk.Email.Contains(search.Email))
                             && (string.IsNullOrEmpty(search.contentPayment) || payment.NotePayment.Contains(search.contentPayment))
                             && (string.IsNullOrEmpty(search.PaymentMethod) || payment.PaymentMethod.Contains(search.PaymentMethod))
                             && (search.BookingID == null || payment.BookingID == search.BookingID)
                             && (search.DateStart == null || payment.PaymentDate.Value.Date >= search.DateStart.Value.Date)
                             && (search.DateEnd == null || payment.PaymentDate.Value.Date <= search.DateEnd.Value.Date)))
                         orderby payment.PaymentDate descending

                         select new PaymentResDTO
                         {
                             UserID = payment.UserID,
                             Username = subUser != null ? subUser.Username : "",
                             FullName = subUser != null ? subUser.Username : subBk.Name,
                             IdHomeStay = subBk.HomeStayID + "",
                             Email = subUser != null ? subUser.Email : subBk.Email,
                             PhoneNumber = subUser != null ? subUser.PhoneNumber : subBk.Phone,
                             BookingID = payment.BookingID,
                             OwnerID = payment.OwnerID,
                             CusID = payment.CusID,
                             PaymentType = payment.PaymentType,
                             NotePayment = payment.NotePayment,
                             Amount = payment.Amount,
                             AdvertisementID = payment.AdvertisementID,
                             PaymentStatus = payment.PaymentStatus,
                             PaymentMethod = payment.PaymentMethod,
                             PaymentDate = payment.PaymentDate
                         }).AsQueryable();

            var total = await query.CountAsync();

            var items = await query.Skip((paginate.Page - 1) * paginate.PageSize).Take(paginate.PageSize).ToListAsync();

            return new PagedResultDTO<dynamic>
            {
                TotalCount = total,
                Items = items
            };
        }

        public async Task<PagedResultDTO<dynamic>?> GetPaymentsByOwner(PaginateDTO paginate, int type, string idOwner, SearchPaymentDTO search)
        {
            var query = (from payment in _dbContext.Payments
                         join user in _dbContext.Users
                         on payment.UserID equals user.UserID into userGroup
                         from subUser in userGroup.DefaultIfEmpty()
                         join booking in _dbContext.Bookings
                         on payment.BookingID equals booking.BookingID
                         where booking.OwnerID == idOwner && payment.BookingID != null
                         &&
                             (string.IsNullOrEmpty(search.UserName) || (subUser != null ? subUser.FullName.Contains(search.UserName) : booking.Name.Contains(search.UserName))
                             && (string.IsNullOrEmpty(search.Email) || (subUser != null ? subUser.Email.Contains(search.Email) : booking.Email.Contains(search.Email))
                             && (string.IsNullOrEmpty(search.contentPayment) || payment.NotePayment.Contains(search.contentPayment))
                             && (string.IsNullOrEmpty(search.PaymentMethod) || payment.PaymentMethod.Contains(search.PaymentMethod))
                             && (search.BookingID == null || payment.BookingID == search.BookingID)
                             && (search.DateStart == null || payment.PaymentDate.Value.Date >= search.DateStart.Value.Date)
                             && (search.DateEnd == null || payment.PaymentDate.Value.Date <= search.DateEnd.Value.Date)))
                         orderby payment.PaymentDate descending

                         select new PaymentResDTO
                         {
                             UserID = payment.UserID,
                             Username = subUser != null ? subUser.Username : "",
                             FullName = subUser != null ? subUser.Username : booking.Name,
                             IdHomeStay = booking.HomeStayID + "",
                             Email = subUser != null ? subUser.Email : booking.Email,
                             PhoneNumber = subUser != null ? subUser.PhoneNumber : booking.Phone,
                             PaymentID = payment.PaymentID,
                             BookingID = payment.BookingID,
                             OwnerID = payment.OwnerID,
                             CusID = payment.CusID,
                             PaymentType = payment.PaymentType,
                             NotePayment = payment.NotePayment,
                             Amount = payment.Amount,
                             AdvertisementID = payment.AdvertisementID,
                             PaymentStatus = payment.PaymentStatus,
                             PaymentMethod = payment.PaymentMethod,
                             PaymentDate = payment.PaymentDate
                         }).AsQueryable();

            var total = await query.CountAsync();

            var items = await query.Skip((paginate.Page - 1) * paginate.PageSize).Take(paginate.PageSize).ToListAsync();

            return new PagedResultDTO<dynamic>
            {
                TotalCount = total,
                Items = items
            };
        }

        public async Task<Payment?> GetPaymentById(int paymentID)
        {
            return await _dbContext.Payments.FirstOrDefaultAsync(p => p.PaymentID == paymentID);
        }

        public async Task<bool> CreatePayment(Payment payment)
        {
            var paymentEntity = await _dbContext.Payments.AddAsync(payment);
            if (paymentEntity.Entity.PaymentStatus == 1)
            {
                var bookingProcess = await _dbContext.BookingProcesses.FindAsync(paymentEntity.Entity.BookingID);
                bookingProcess!.PaymentTime = TimeHelper.GetDateTimeVietnam();
                bookingProcess!.StepOrder = 2;
            }
            return await _dbContext.SaveChangesAsync() > 0;
        }



    }
}
