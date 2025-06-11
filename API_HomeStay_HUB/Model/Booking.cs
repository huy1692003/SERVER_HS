using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.Model
{
    [Table("Bookings")]
    public class Booking
    {
        [Key]
        [Column("bookingID")]
        public int BookingID { get; set; }

        [Column("cusID")]
        public string? CustomerID { get; set; }

        [Column("ownerID")]
        public string? OwnerID { get; set; }

        [Column("email")]
        public string? Email { get; set; }

        [Column("phone")]
        public string? Phone { get; set; }

        [Column("name")]
        public string? Name { get; set; }

        [Column("homestayID")]
        public int? HomeStayID { get; set; }       

        [Column("checkInDate")]
        public DateTime CheckInDate { get; set; }

        [Column("checkOutDate")]
        public DateTime CheckOutDate { get; set; }
      
        [Column("totalPrice")]
        public double? TotalPrice { get; set; }

        [Column("paymentMethod")]
        public string? PaymentMethod { get; set; }

        [Column("discountPrice")]
        public double? DiscountPrice { get; set; }

        [Column("discountCode")]
        public string? DiscountCode { get; set; }

        [Column("originalPrice")]
        public double? OriginalPrice { get; set; }

        [Column("extraCost")]
        public double? ExtraCost { get; set; }

        [Column("CMND")]
        public string? CMND { get; set; }

        [Column("description")]
        public string? Description { get; set; }

        [Column("detailExtraCost")]
        public string? DetailExtraCost { get; set; }
        
        [Column("detailBooking")]
        public string? DetailBookingString { get; set; }  


        [Column("isConfirm")]
        public bool IsConfirm { get; set; } = false;

        [Column("isCancel")]
        public bool IsCancel { get; set; } = false;
        [Column("isSuccess")]
        public bool IsSuccess { get; set; }

        [Column("statusBK")]
        public int? status { get; set; }

        [Column("reasonCancel")]
        public string? ReasonCancel { get; set; }

        [Column("bookingTime")]
        public DateTime? BookingTime { get; set; }

        [Column("timeConfirm")]
        public DateTime? TimeConfirm { get; set; }

        [Column("timeReviewRating")]
        public DateTime? timeReviewRating { get; set; }

        [Column("linkBill")]
        public string? LinkBill { get; set; }

        [NotMapped]
        public BookingProcess? bookingProcess { get; set; }

        [NotMapped]
        public string? nameOwner { get; set; }

        [NotMapped]
        public bool isOwnerCreated { get; set; } = false;

        [NotMapped]
        public string? phoneOwner { get; set; }

        [NotMapped]
        public List<DetailBooking>? DetailBooking { get; set; }
    }
}
