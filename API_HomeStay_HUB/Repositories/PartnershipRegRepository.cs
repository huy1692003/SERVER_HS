using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Intefaces;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Repositories
{
    public class PartnershipRegRepository : IPartnershipRegRepository
    {
        private readonly DBContext _dbContext;
        private readonly ISendMaillService _sendM;
        public PartnershipRegRepository(DBContext dBContext,ISendMaillService sendMaill)
        {
            _dbContext = dBContext;
            _sendM = sendMaill;

        }
        public async Task<IEnumerable<PartnershipReg?>> getbyStatus(int status)
        {
            return await _dbContext.PartnershipRegs.Where(s => s.Status == status).ToListAsync();
        }
        public async Task<bool> registerParterShip(PartnershipReg partnershipReg)
        {
           
                await _dbContext.PartnershipRegs.AddAsync(partnershipReg);
                return await _dbContext.SaveChangesAsync() > 0;
            
        }
        public async Task<bool> updateStatus_PartnerShip(int status, int idPart, string noteReject = "")
        {
            var PartnerShip = await _dbContext.PartnershipRegs.FindAsync(idPart);
            if (PartnerShip == null)
            {
                return false;
            }
            else
            {
                // Xét duyệt đơn đăng ký
                if (status == 1)
                {
                    PartnerShip.Status = 1;
                    var guid = Guid.NewGuid().ToString();

                    // Tạo OwnerStay khi đã duyệt đơn đăng ký
                    var idUser = (await _dbContext.Customers.FirstOrDefaultAsync(s => s.CusID == PartnerShip.CustomerID))!.UserID;
                    var user = await _dbContext.Users.FirstOrDefaultAsync(u => u.UserID == idUser);
                    user!.TypeUser = 1;
                    await _dbContext.OwnerStays.AddAsync(new OwnerStay { OwnerID = guid, UserID = idUser });

                    // Gửi email thông báo về việc xét duyệt
                    var subject = "Đơn đăng ký hợp tác của bạn đã được duyệt";
                    var content = $@"
                <h3>Xin chào {PartnerShip.FullName},</h3>
                <p>Chúng tôi vui mừng thông báo rằng đơn đăng ký hợp tác của bạn đã được duyệt thành công.</p>
                <p><strong>Trạng thái hiện tại:</strong> Đã duyệt</p>
                <p>Cảm ơn bạn đã đăng ký và hợp tác với chúng tôi!</p>
                <p>Trân trọng,</p>
                <p>Đội ngũ HomeStay</p>";

                    // Gửi email
                    await _sendM.SendMaill(PartnerShip.Email!, subject, content);
                }
                // Hủy đơn đăng ký
                else
                {
                    PartnerShip.Status = 2;
                    PartnerShip.RejectionReason = noteReject;

                    // Gửi email thông báo về việc từ chối đơn đăng ký
                    var customer = await _dbContext.Customers.FirstOrDefaultAsync(c => c.CusID == PartnerShip.CustomerID);
                    var user = await _dbContext.Users.FirstOrDefaultAsync(u => u.UserID == customer!.UserID);

                    var subject = "Đơn đăng ký hợp tác của bạn đã bị từ chối";
                        var content = $@"
                    <h3>Xin chào {PartnerShip?.FullName},</h3>
                    <p>Chúng tôi rất tiếc khi thông báo rằng đơn đăng ký hợp tác của bạn đã bị từ chối.</p>
                    <p><strong>Lý do từ chối:</strong> {noteReject}</p>
                    <p>Hy vọng chúng ta có thể hợp tác trong tương lai.</p>
                    <p>Trân trọng,</p>
                    <p>Đội ngũ HomeStay</p>";

                    // Gửi email
                    await _sendM.SendMaill(PartnerShip.Email!, subject, content);

                }

                return await _dbContext.SaveChangesAsync() > 0;
            }
        }

        public async Task<PartnershipReg?> getDetail_PartnerShip(int id)
        {
            return await _dbContext.PartnershipRegs.FindAsync(id);
        }

    }
}
