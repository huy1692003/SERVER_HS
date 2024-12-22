using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.Model
{
    [Table("Notification")]
    public class Notification
    {
        [Column("Id")]
        [Key]
        public int Id { get; set; }  // Khóa chính

        [Column("UserID")]
        public string UserID { get; set; }

        [Column("Title")]
        public string Title { get; set; }  // Tiêu đề thông báo

        [Column("Message")]
        public string Message { get; set; }  // Nội dung thông báo

        [Column("Type")]
        public string? Type { get; set; }  // Nội dung thông báo

        [Column("CreatedAt")]
        public DateTime CreatedAt { get; set; }  // Thời gian tạo thông báo

        [Column("IsRead")]
        public bool IsRead { get; set; }  // Trạng thái đọc của thông báo (true là đã đọc, false là chưa đọc)
    }
}