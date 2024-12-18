using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Interfaces;
using API_HomeStay_HUB.Services.Interface;

namespace API_HomeStay_HUB.Services
{
    public class PaymentService:IPaymentService
    {
        private readonly IPaymentRepository _paymentRepository;
        public PaymentService(IPaymentRepository paymentRepository)
        {
            _paymentRepository = paymentRepository;
        }
        public async Task<PagedResultDTO<dynamic>?> GetPayments(PaginateDTO paginate, int type, SearchPaymentDTO search)
        {

            return await _paymentRepository.GetPayments(paginate,type,search);
        }   
        public async Task<PagedResultDTO<dynamic>?> GetPaymentsByOwner(PaginateDTO paginate, int type, string idOwner, SearchPaymentDTO search)
        {

            return await _paymentRepository.GetPaymentsByOwner(paginate,type,idOwner,search);
        }
        public async Task<Payment?> GetPaymentById(int paymentID)
        {
            return await _paymentRepository.GetPaymentById(paymentID);
        }
        public async Task<bool> CreatePayment(Payment payment)
        {
            return await _paymentRepository.CreatePayment(payment);
        }
    }
}
