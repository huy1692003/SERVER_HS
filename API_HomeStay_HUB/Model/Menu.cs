using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.Model
{
    [Table("Menu")]
    public class Menu
    {
        [Key]
        [Column("MenuID")]
        public int? MenuID { get; set; }          // Khóa chính của Menu
        [Column("Name")]
        public string? Name { get; set; }         // Tên menu
        [Column("Icon")]
        public string? Icon { get; set; }         // Icon của menu
        [Column("Url")]
        public string? Url { get; set; }          // Đường dẫn URL của menu
        [Column("ParentMenuID")]
        public int? ParentMenuID { get; set; }
        [NotMapped]
        public List<Menu>? children {  get; set; }
    }
}
