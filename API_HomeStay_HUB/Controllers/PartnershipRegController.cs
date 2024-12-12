using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PartnershipRegController : ControllerBase
    {
        private readonly IPartnershipRegService _regService;
        private readonly DBContext _db;
        public PartnershipRegController(IPartnershipRegService regService, DBContext dBContext)
        {
            _regService = regService;
            _db = dBContext;
        }
        [HttpGet("getbyStatus/{status}")]
        public async Task<IActionResult> getbyStatus(int status)
        {
            return Ok(await _regService.getbyStatus(status));
        }
        [HttpPost("registerPartnershipReg")]
        public async Task<IActionResult> registerPartnershipReg([FromBody] PartnershipReg partnership)
        {
            if (partnership == null)
            {
                return BadRequest("Dữ liệu không được trống");
            }
            else
            {
                if (!checkExistedPartnerShip(partnership.CustomerID!))
                {
                    {

                        if (await _regService.registerParterShip(partnership))
                        {
                            return Ok("Đăng kí thành công hiện đang chờ phê duyệt");
                        }
                        return BadRequest("Dữ liệu không hợp lệ");
                    }

                }
                else
                {
                    return BadRequest("Đơn đăng ký của bạn đang được chờ xét duyệt hoặc bạn đã là đối tác của chúng tôi");
                }


            }
        }
        [HttpPut("cancelPartReg/{idPart}/{rejectReason}")]
        public async Task<IActionResult> cancelPartReg(int idPart, string rejectReason)
        {
            bool check = await _regService.cancel_PartnerShip(idPart, rejectReason);
            return check ? Ok() : NotFound();
        }

        [HttpPut("confirmPartReg/{idPart}")]
        public async Task<IActionResult> confirmPartReg(int idPart)
        {
            bool check = await _regService.confirm_PartnerShip(idPart);
            return check ? Ok() : NotFound();
        }
        [HttpGet("getById/{idPart}")]
        public async Task<IActionResult> getDetail_PartnerShip(int idPart)
        {
            var result = await _regService.getDetail_PartnerShip(idPart);
            if (result != null)
            {
                return Ok(result);
            }
            return NotFound();
        }
        private bool checkExistedPartnerShip(string idCus)
        {
            return _db.PartnershipRegs.Any(p => p.CustomerID == idCus &&( p.Status==0 || p.Status==1));
        }

    }
}
