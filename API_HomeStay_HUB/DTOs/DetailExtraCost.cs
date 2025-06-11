public class JsonDetailExtraCost
{
    public List<ServiceCost> serviceCost { get; set; } // Danh sách chi phí dịch vụ
    public List<OtherCost> otherCost { get; set; } // Danh sách các khoản phí khác
    public List<RoomDetailCharge> roomDetailCharges { get; set; } // Danh sách chi tiết phí của từng phòng
    public double totalExtraCost { get; set; } // Tổng chi phí phụ
}

public class ServiceCost
{
    public int serviceId { get; set; } // ID dịch vụ
    public string serviceName { get; set; } // Tên dịch vụ
    public int quantity { get; set; } // Số lượng
    public double price { get; set; } // Đơn giá
    public double total { get; set; } // Thành tiền
}

public class OtherCost
{
    public string name { get; set; } // Tên khoản phí
    public double amount { get; set; } // Số tiền
}

public class RoomDetailCharge
{
    public int roomId { get; set; } // ID phòng
    public string roomName { get; set; } // Tên phòng
    public RoomLimits limits { get; set; } // Giới hạn số lượng khách của phòng
    public ActualGuests actual { get; set; } // Số lượng khách thực tế
    public ExtraFees fees { get; set; } // Phí cho khách phụ theo từng loại
    public ExtraPeopleCharges extraPeople { get; set; } // Chi tiết phí khách phụ
}

public class RoomLimits
{
    public int maxAdults { get; set; } // Số người lớn tối đa
    public int maxChildren { get; set; } // Số trẻ em tối đa
    public int maxBaby { get; set; } // Số em bé tối đa
}

public class ActualGuests
{
    public int numberAdults { get; set; } // Số người lớn thực tế
    public int numberChildren { get; set; } // Số trẻ em thực tế
    public int numberBaby { get; set; } // Số em bé thực tế
}

public class ExtraFees
{
    public double extraFeePerAdult { get; set; } // Phí cho mỗi người lớn phụ
    public double extraFeePerChild { get; set; } // Phí cho mỗi trẻ em phụ
    public double extraFeePerBaby { get; set; } // Phí cho mỗi em bé phụ
}

public class ExtraPeopleCharges
{
    public ExtraPerson adults { get; set; } // Phí người lớn phụ
    public ExtraPerson children { get; set; } // Phí trẻ em phụ
    public ExtraPerson babies { get; set; } // Phí em bé phụ
}

public class ExtraPerson
{
    public int count { get; set; } // Số lượng khách phụ
    public double fee { get; set; } // Phí cho mỗi khách phụ
    public double total { get; set; } // Tổng phí cho loại khách này
}