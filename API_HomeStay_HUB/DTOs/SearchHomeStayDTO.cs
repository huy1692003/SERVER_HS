using System.ComponentModel.DataAnnotations.Schema;
using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.DTOs
{
    public class SearchHomeStayDTO
    {
        // Tiêu chí tìm kiếm cơ bản
        public string? Location { get; set; } = ""; // Vị trí
        public string? PriceRange { get; set; } = ""; // Khoảng giá
        public string? Name { get; set; } = ""; // Tên
        public int? NumberAdults { get; set; } = 1;// Số lượng người lớn
        public int? NumberChildren { get; set; } // Số lượng trẻ em
        public int? NumberBaby { get; set; } // Số lượng em bé
        public List<int>? Amenities { get; set; } 
        public DateTime? DateIn { get; set; } // Ngày nhận phòng
        public DateTime? DateOut { get; set; } // Ngày trả phòng
        
        // Các thuộc tính liên quan đến phòng
        public bool? HasBalcony { get; set; } // Có ban công
        public bool? HasTv { get; set; } // Có TV
        public bool? HasAirConditioner { get; set; } // Có máy lạnh
        public bool? HasRefrigerator { get; set; } // Có tủ lạnh
        public bool? HasWifi { get; set; } // Có Wi-Fi
        public bool? HasHotWater { get; set; } // Có nước nóng
        public int? NumberOfBeds { get; set; } // Số lượng giường
        public int? BathroomCount { get; set; } // Số lượng phòng tắm
        public string? RoomSize { get; set; } // Diện tích phòng
        
        // Các thuộc tính liên quan đến HomeStay
        public int? Rating { get; set; } // Điểm đánh giá
        public bool? HasParking { get; set; } // Có bãi đỗ xe
        public bool? HasPool { get; set; } // Có hồ bơi
        public bool? HasGarden { get; set; } // Có vườn
        public string? HomeStayType { get; set; } // Loại HomeStay
        
        // Các thuộc tính liên quan đến cảnh quan
        public bool? HasLakeView { get; set; } // Có view hồ
        public bool? HasMountainView { get; set; } // Có view núi
        public bool? HasSeaView { get; set; } // Có view biển
        public bool? HasRiceFieldView { get; set; } // Có view cánh đồng lúa
        
        // Các tính năng bổ sung
        public bool? HasBilliardTable { get; set; } // Có bàn bi-a
        public bool? HasManyActivities { get; set; } // Có nhiều hoạt động
        public bool? HasSpaciousGarden { get; set; } // Có vườn rộng rãi

        //-1:Thấp dần, 0:Không sắp xếp, 1:Tăng dần
        public int? SortByPrice { get; set; } = 0; // Sắp xếp theo giá
        public int? SortByRating { get; set; } = 0; // Sắp xếp theo đánh giá
    }
}