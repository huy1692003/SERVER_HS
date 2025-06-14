﻿using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.DTOs
{
    public class LoginUserResDTO
    {
        public string? Username { get; set; }
        public string? Fullname { get; set; }
        public string? TokenUser { get; set; }
        public string? idCus {  get; set; }
        public string? idOwner { get; set; }
        public string? idAdmin { get; set; }
        public string? idUser { get; set; }
        public string? Avatar { get; set; }

        public string? roleID { get; set; }
        public List<Menu>? menus { get; set; }
    }
}
