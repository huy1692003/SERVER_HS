﻿namespace API_HomeStay_HUB.DTOs
{
    public class PagedResultDTO<T>
    {
        public IEnumerable<T> Items { get; set; } = new List<T>();
        public int TotalCount { get; set; }
    }
}
