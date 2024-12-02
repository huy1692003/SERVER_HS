using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.Repositories.Interfaces
{
    public interface IPaymentRepository
    {
        Task<IEnumerable<Payment>> GetAllPayments();        
        Task<Payment?> GetPaymentById(int paymentID);
        Task<bool> CreatePayment(Payment payment);
    }
}
