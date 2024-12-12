using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.DTOs
{
    public class RegisterAdminDTO : User
    {


        public new string? Customer => null;
        public new string? OwnerStay => null;
        public new string? Administrator => null;
        public string roleID { get; set; } = "";
    }
}
