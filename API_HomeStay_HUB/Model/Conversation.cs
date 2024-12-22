using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.Model
{
    [Table("Conversations")]
    public class Conversation
    {
        [Key]
        [Column("conversationID")]
        public int? ConversationID { get; set; }  // Sửa: Không cần nullable vì là khóa chính

        [Column("idUser1")]
        public string User1 { get; set; }  // Chứa tên người dùng thứ nhất

        [Column("idUser2")]
        public string User2 { get; set; }  // Chứa tên người dùng thứ hai

        [Column("createdAt")]
        public DateTime CreatedAt { get; set; }  // Ngày tạo cuộc trò chuyện

        [Column("lastMessageAt")]
        public DateTime LastMessageAt { get; set; }  // Thời gian của tin nhắn cuối cùng
      

        [Column("userName1")]
        public string UserName1 { get; set; }  // Tên người dùng thứ nhất

        [Column("userName2")]
        public string UserName2 { get; set; }  // Tên người dùng thứ hai

        [NotMapped]
        public List<Message>? Messages { get; set; }  // Các tin nhắn trong cuộc trò chuyện
    }
}
