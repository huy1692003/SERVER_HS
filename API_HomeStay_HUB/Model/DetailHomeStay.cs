using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_HomeStay_HUB.Model
{
    [Table("DetailHomeStays")]
    public class DetailHomeStay
    {
        [Key]
        [Column("id")]
        public int? ID { get; set; } // KHÔNG nullable vì là khóa chính có IDENTITY

        [Column("homestayID")]
        public int? HomestayID { get; set; } // có thể null đúng như trong DB

        

        [Column("noteHomestay")]
        public string? NoteHomestay { get; set; }

        [Column("stayRules")]
        public string? StayRules { get; set; }

        [Column("hasSwimmingPool")]
        public bool? HasSwimmingPool { get; set; }

        [Column("hasBilliardTable")]
        public bool? HasBilliardTable { get; set; }

        [Column("manyActivities")]
        public bool? ManyActivities { get; set; }

        [Column("spaciousGarden")]
        public bool? SpaciousGarden { get; set; }

        [Column("lakeView")]
        public bool? LakeView { get; set; }

        [Column("mountainView")]
        public bool? MountainView { get; set; }

        [Column("seaView")]
        public bool? SeaView { get; set; }

        [Column("riceFieldView")]
        public bool? RiceFieldView { get; set; }

        [Column("policies")]
        public string? Policies { get; set; }
    }
}
