﻿using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.DTOs
{
    public class HomeStayResDTO
    {
        public HomeStay? HomeStay { get; set; }
        public DetailHomeStay? DetailHomeStay { get; set; }
        public List<Room>? Rooms { get; set; }

        public User? Owner { get; set; }
    }
}
