using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.IO;
using System.Threading.Tasks;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private readonly string _imagePath;

        public UploadController(IConfiguration configuration)
        {
            _imagePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Images");

            // Tạo thư mục nếu chưa tồn tại
            if (!Directory.Exists(_imagePath))
            {
                Directory.CreateDirectory(_imagePath);
            }
        }

        [HttpPost("uploadFile")]
        public async Task<IActionResult> UploadImage(IFormFile file)
        {
            if (file == null || file.Length == 0)
            {
                return BadRequest("No file uploaded.");
            }

            // Tạo tên file mới bằng cách sử dụng thời gian hiện tại
            var timeStamp = DateTime.Now.ToString("yyyyMMdd_HHmmss");
            var fileExtension = Path.GetExtension(file.FileName);
            var fileName = $"{timeStamp}{fileExtension}";
            var filePath = Path.Combine(_imagePath, fileName);

            // Kiểm tra loại file (có thể điều chỉnh theo nhu cầu)
            var validFileTypes = new[] { ".jpg", ".jpeg", ".png", ".gif" };
            if (!validFileTypes.Contains(fileExtension.ToLowerInvariant()))
            {
                return BadRequest("Invalid file type. Only .jpg, .jpeg, .png, and .gif are allowed.");
            }

            // Lưu file
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            // Trả về đường dẫn của file đã lưu
            return Ok(new { FilePath = "/Images/"+fileName });
        }


        [HttpPost("uploadListFile")]
        public async Task<IActionResult> UploadImages(List<IFormFile> files)
        {
            if (files == null || files.Count == 0)
            {
                return BadRequest("No files uploaded.");
            }

            var uploadedFiles = new List<string>();

            foreach (var file in files)
            {
                // Kiểm tra file có rỗng không
                if (file.Length == 0)
                {
                    continue;
                }

                // Tạo tên file mới bằng cách sử dụng thời gian hiện tại
                var timeStamp = DateTime.Now.ToString("yyyyMMdd_HHmmss");
                var fileExtension = Path.GetExtension(file.FileName);
                var random = new Random();
                var randomNumber = random.Next(1, 9999999); // Tạo số ngẫu nhiên từ 1000 đến 9999
                var fileName = $"{timeStamp}_{randomNumber}_{fileExtension}";
                var filePath = Path.Combine(_imagePath, fileName);
                // Tạo số ngẫu nhiên
                // Kiểm tra loại file (có thể điều chỉnh theo nhu cầu)
                var validFileTypes = new[] { ".jpg", ".jpeg", ".png", ".gif" };
                if (!validFileTypes.Contains(fileExtension.ToLowerInvariant()))
                {
                    return BadRequest($"Invalid file type for {file.FileName}. Only .jpg, .jpeg, .png, and .gif are allowed.");
                }

                // Lưu file
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                // Thêm đường dẫn file đã upload vào danh sách kết quả
                uploadedFiles.Add($"/Images/{fileName}");
            }

            if (uploadedFiles.Count == 0)
            {
                return BadRequest("No valid files uploaded.");
            }

            // Trả về danh sách đường dẫn của các file đã lưu
            return Ok(new { FilePaths = uploadedFiles });
        }
    }
}
