using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using System.Threading.Channels;

namespace API_HomeStay_HUB.Services
{
    public class BookingQueueService
    {
        ILogger<BookingQueueService> _logger;
        // Tạo một Channel để lưu trữ các booking cần xử lý (kiểu hàng đợi bất đồng bộ)
        private readonly Channel<Booking> _channel;

        // Dùng để tạo scope dịch vụ khi xử lý (giúp lấy các service như Repository, Hub...)
        private readonly IServiceProvider _serviceProvider;

        public BookingQueueService(IServiceProvider serviceProvider, ILogger<BookingQueueService> logger)
        {
            _channel = Channel.CreateUnbounded<Booking>(); // Channel không giới hạn
            _serviceProvider = serviceProvider;

            // Khởi động hàm xử lý hàng đợi chạy nền (background)
            _ = Task.Run(ProcessQueueAsync);
            _logger = logger;
        }

        // Thêm booking mới vào hàng đợi
        public async Task EnqueueAsync(Booking booking)
        {
            await _channel.Writer.WriteAsync(booking);
        }

        // Hàm xử lý từng booking trong hàng đợi, chạy liên tục ở background
        private async Task ProcessQueueAsync()
        {
            _logger.LogInformation("Bắt đầu xử lý hàng đợi booking...");
            await foreach (var booking in _channel.Reader.ReadAllAsync())
            {
                _logger.LogInformation("Đang xử lý booking: {BookingID}", booking.BookingID);
                try
                {
                    // Tạo scope dịch vụ mới cho mỗi lần xử lý
                    using var scope = _serviceProvider.CreateScope();

                    // Lấy service xử lý booking (BookingHandler)
                    var bookingHandler = scope.ServiceProvider.GetRequiredService<IBookingHandler>();

                    // Gọi xử lý booking
                    await bookingHandler.ProcessBookingAsync(booking);
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, "Lỗi khi xử lý booking trong hàng đợi");
                    // Nếu có lỗi thì in ra log (sau này có thể ghi log vào file/database)
                    Console.WriteLine($"Lỗi khi xử lý booking: {ex.Message}");
                }
            }
        }
    }
}
