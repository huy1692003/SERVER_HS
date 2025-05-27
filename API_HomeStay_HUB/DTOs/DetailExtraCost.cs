public class JsonDetailExtraCost
{
    public ExtraPersonCost extraPersonCost { get; set; }
    public List<ServiceCost> serviceCost { get; set; }
    public List<OtherCost> otherCost { get; set; }
    public double totalExtraCost { get; set; }
}

public class ExtraPersonCost
{
    public ExtraPerson extraAdult { get; set; }
    public ExtraPerson extraChild { get; set; }
    public ExtraPerson extraBaby { get; set; }
}

public class ExtraPerson
{
    public int count { get; set; }
    public double fee { get; set; }
    public double total { get; set; }
}

public class ServiceCost
{
    public int serviceId { get; set; }
    public string serviceName { get; set; }
    public int quantity { get; set; }
    public double price { get; set; }
    public double total { get; set; }
}

public class OtherCost
{
    public string name { get; set; }
    public double amount { get; set; }
}