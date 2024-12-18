using API_HomeStay_HUB.Model;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace API_HomeStay_HUB.DTOs
{
    public class PaymentResDTO
    {

        public string? UserID { get; set; }
        public string? Username { get; set; }
        public string? FullName { get; set; }
        public string? Email { get; set; }
        public string? IdHomeStay { get; set; }
        public string? PhoneNumber { get; set; }
        public int PaymentID { get; set; }
        public int? BookingID { get; set; }
        public string? OwnerID { get; set; }
        public string? CusID { get; set; }
        public int? PaymentType { get; set; }
        public string? NotePayment { get; set; }
        public double? Amount { get; set; }
        public int? AdvertisementID { get; set; }
        public int? PaymentStatus { get; set; }
        public string? PaymentMethod { get; set; }
        public DateTime? PaymentDate { get; set; }

    }

}



