﻿using Microsoft.EntityFrameworkCore;
using API_HomeStay_HUB.Model; // Đảm bảo bạn đã import model Administrator

namespace API_HomeStay_HUB.Data
{
    public class DBContext : DbContext
    {
        public DBContext(DbContextOptions<DBContext> options) : base(options) { }

        public DbSet<Administrator> Administrators { get; set; }
        public DbSet<Advertisement> Advertisements { get; set; }
        public DbSet<Amenities> Amenities { get; set; }
        public DbSet<Article> Articles { get; set; }
        public DbSet<Booking> Bookings { get; set; }
        public DbSet<BookingProcess> BookingProcesses { get; set; }
        public DbSet<CategoryArticle> CategoryArticles { get; set; }
        public DbSet<Conversation> Conversations { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<FAQ> FAQs { get; set; }
        public DbSet<Menu> Menus { get; set; }
        public DbSet<Favorites> Favorites { get; set; }
        public DbSet<HomeStay> HomeStays { get; set; }
        public DbSet<PartnershipReg> PartnershipRegs { get; set; }
        public DbSet<DetailHomeStay> DetailHomeStays { get; set; }
        public DbSet<HomeStayAmenities> HomeStayAmenities { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<OwnerStay> OwnerStays { get; set; }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<Promotion> Promotions { get; set; }
        public DbSet<Notification> Notifications { get; set; }
        public DbSet<ReviewAndRating> ReviewAndRatings { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Room> Rooms { get; set; }
        public DbSet<Service> Services { get; set; }
        public DbSet<Setting> Settings { get; set; }
        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
           
  


        }

    }
}
