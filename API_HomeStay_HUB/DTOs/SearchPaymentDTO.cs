using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace API_HomeStay_HUB.DTOs
{
    public class SearchPaymentDTO
    {   
        public int? BookingID { get; set; }
       
        public string? UserName { get; set; }

        public string? Email {  get; set; }
     
        public int? AdvertisementID { get; set; }

        public string? contentPayment {  get; set; }
        public string? PaymentMethod { get; set; }
    
        public DateTime? DateStart { get; set; }
        public DateTime? DateEnd { get; set; }
    }
}
