using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.Repositories.Interfaces
{
    public interface IPaymentRepository
    {
        Task<PagedResultDTO<dynamic>?> GetPayments(PaginateDTO paginate ,int type ,SearchPaymentDTO search);
        Task<PagedResultDTO<dynamic>?> GetPaymentsByOwner(PaginateDTO paginate, int type, string idOwner, SearchPaymentDTO search);
        Task<Payment?> GetPaymentById(int paymentID);
        Task<bool> CreatePayment(Payment payment);
    }
}
