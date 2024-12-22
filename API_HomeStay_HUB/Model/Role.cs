using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
namespace API_HomeStay_HUB.Model
{
    [Table("Roles")]
    public class Role
    {
        [Key]
        [Column("roleID")]
        public string? RoleID { get; set; }

        [Column("nameRole")]
        public string? NameRole { get; set; }
        
        [Column("permission")]
        public string? Permission { get; set; }

        [NotMapped]
        public List<int>? listMenus { get; set; }
    }
}
