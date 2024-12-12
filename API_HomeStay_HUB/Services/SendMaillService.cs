using System.Net.Mail;
using System.Net;
using API_HomeStay_HUB.Services.Interface;

namespace API_HomeStay_HUB.Services
{
    public class SendMaillService:ISendMaillService
    {
        private readonly string _smtpServer = "smtp.gmail.com"; // Máy chủ SMTP (ví dụ: Gmail)
        private readonly int _smtpPort = 587; // Cổng SMTP
        private readonly string _emailFrom = "daohuy1692003@gmail.com"; // Email gửi
        private readonly string _emailPassword = "zupo tipn voaq dgym"; // Mật khẩu email

        public async Task<bool> SendMaill(string toMail, string title, string content)
        {
            try
            {
                // Tạo đối tượng MailMessage
                var mailMessage = new MailMessage
                {
                    From = new MailAddress(_emailFrom),
                    Subject = title,
                    Body = content,
                    IsBodyHtml = true // Nội dung email hỗ trợ HTML
                };

                // Thêm email người nhận
                mailMessage.To.Add(toMail);

                // Cấu hình SMTP client
                using (var smtpClient = new SmtpClient(_smtpServer, _smtpPort))
                {
                    smtpClient.Credentials = new NetworkCredential(_emailFrom, _emailPassword);
                    smtpClient.EnableSsl = true; // Kích hoạt SSL
                    await smtpClient.SendMailAsync(mailMessage); // Gửi email
                }
                return true;
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có
                Console.WriteLine($"Gửi email thất bại: {ex.Message}");
                return false;
            }
        }
    }
}
