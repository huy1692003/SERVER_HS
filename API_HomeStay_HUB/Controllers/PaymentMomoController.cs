using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Model.Momo;
using API_HomeStay_HUB.Services;
using Microsoft.AspNetCore.Mvc;

namespace API_HomeStay_HUB.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PaymentMomoController : Controller
    {
        public string returnUrl_Owner = "http://localhost:3000/admin/advertisement-manager";
        public string returnUrl_Customer = "http://localhost:3000/history-booking";


        private readonly PaymentMomoService paymentMomoService;
        private readonly DBContext db;
        public PaymentMomoController(PaymentMomoService paymentMomoService, DBContext db)
        {
            this.paymentMomoService = paymentMomoService;
            this.db = db;
        }
        [HttpPost]
        public async Task<IActionResult> CreatePaymentMomo(BookingInfor booking)
        {
            var reponse = await paymentMomoService.CreatePaymentAsync(booking);
            return Ok(reponse);
        }

        [HttpGet]
        public IActionResult PaymentCallBack()
        {
            try
            {
                var res = paymentMomoService.PaymentExecuteAsync(HttpContext.Request.Query);
                var amount = Request.Query["amount"].ToString();
                var orderInfo = Request.Query["orderInfo"].ToString();
                var orderId = Request.Query["orderId"].ToString();
                var errorCode = Request.Query["errorCode"].ToString();
                var message = Request.Query["message"].ToString();

                // Xử lý theo errorCode
                if (errorCode == "0")
                {
                    // Tách chuỗi và lấy phần trước và sau dấu '-'
                    var parts = orderId.Split('-');
                    string code = parts[1];
                    string type = parts.Length > 1 ? parts[2] : string.Empty;
                    if (type == "tp")
                    {
                        var bookprocess = db.BookingProcesses.FirstOrDefault(s => s.BookingID == int.Parse(code));
                        var book = db.Bookings.FirstOrDefault(s => s.BookingID == int.Parse(code));
                        book!.status = 3;
                        //Chuyển sang chờ nhận phòng
                        bookprocess!.StepOrder = 1;
                        bookprocess!.PaymentTime = DateTime.Now;
                        createPayment(type, float.Parse(amount), int.Parse(code), book.CustomerID, "");
                        db.SaveChanges();
                        return Redirect(returnUrl_Customer);
                    }

                    else if (type == "tqc")
                    {
                        var Advertisement = db.Advertisements.FirstOrDefault(s => s.AdID == int.Parse(code));
                        Advertisement!.StatusAd = 2;
                        Advertisement!.TimePayment = DateTime.Now;
                        createPayment(type, float.Parse(amount), int.Parse(code), "", Advertisement.OwnerID);
                        return Redirect(returnUrl_Owner);

                    }
                }

                return Ok("success transection");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }


        }


        private void createPayment(string type, float amount, int? code, string? cusID, string? OwnerID)
        {
            Payment payment;
            //Thanh toán tiền phòng 
            if (type == "tp")
            {

                payment = new Payment
                {
                    BookingID = code,
                    CusID = cusID,
                    Amount = amount,
                    PaymentType = 1,
                    PaymentStatus = 1,
                    NotePayment = "Thanh toán tiền phòng cho Booking #" + code,
                    PaymentMethod = "Thanh toán qua Momo",
                    PaymentDate = DateTime.Now,

                };
                db.Payments.Add(payment);

            }
            else if (type == "tqc")
            {
                payment = new Payment
                {
                    AdvertisementID = code,
                    OwnerID = OwnerID,
                    Amount = amount,
                    PaymentType = 1,
                    PaymentStatus = 1,
                    NotePayment = "Thanh toán tiền quảng cáo cho mã #" + code,
                    PaymentMethod = "Thanh toán qua Momo",
                    PaymentDate = DateTime.Now,

                };
                db.Payments.Add(payment);
            }

            db.SaveChanges();
        }



    }
}
