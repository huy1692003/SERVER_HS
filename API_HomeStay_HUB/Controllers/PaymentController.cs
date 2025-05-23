﻿using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Mvc;

namespace API_HomeStay_HUB.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PaymentController : ControllerBase
    {
        private readonly IPaymentService _paymentService;

        public PaymentController(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }

        // GET: api/payment
        [HttpPost ("getPayment")]
        public async Task<IActionResult> GetAllPayments([FromQuery]PaginateDTO paginate, [FromBody] SearchPaymentDTO search, [FromQuery] int type =1)
        {
            var payments = await _paymentService.GetPayments(paginate,type,search);
            return Ok(payments); // Trả về danh sách thanh toán
        } 
        // GET: api/payment
        [HttpPost ("getPaymentbyOwner")]
        public async Task<IActionResult> getPaymentbyOwner([FromQuery]PaginateDTO paginate, [FromBody] SearchPaymentDTO search, [FromQuery] string idOwner ,[FromQuery] int type =1)
        {
            var payments = await _paymentService.GetPaymentsByOwner(paginate,type,idOwner,search);
            return Ok(payments); // Trả về danh sách thanh toán
        }



        // GET: api/payment/{id}
        [HttpGet("getByID/{id}")]
        public async Task<IActionResult> GetPaymentById(int id)
        {
            var payment = await _paymentService.GetPaymentById(id);
            if (payment == null)
            {
                return NotFound("Không tìm thấy thanh toán với ID này."); // Nếu không tìm thấy
            }
            return Ok(payment); // Trả về thông tin thanh toán
        }

        // POST: api/payment
        [HttpPost("create")]
        public async Task<IActionResult> CreatePayment([FromBody] Payment payment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Dữ liệu không hợp lệ."); // Kiểm tra tính hợp lệ của dữ liệu
            }

            var created = await _paymentService.CreatePayment(payment);
            if (created)
            {
                return Ok("Tạo thanh toán thành công!"); // Thông báo thành công
            }
            return StatusCode(500, "Không thể tạo thanh toán.");
        }
    }
}
