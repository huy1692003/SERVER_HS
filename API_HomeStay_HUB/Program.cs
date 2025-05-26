using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Helpers;
using API_HomeStay_HUB.Model.Momo;
using API_HomeStay_HUB.Realtime;
using API_HomeStay_HUB.Repositories;
using API_HomeStay_HUB.Repositories.Intefaces;
using API_HomeStay_HUB.Repositories.Interfaces;
using API_HomeStay_HUB.Services;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Thêm dịch vụ
builder.Services.Configure<MomoOptionModel>(builder.Configuration.GetSection("MomoAPI"));
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<DBContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Cấu hình CORS với chính sách đặt tên
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowFrontend", builder_ =>
    {
        // Lấy danh sách nguồn gốc từ cấu hình
        var allowedOrigins = builder.Configuration.GetSection("AllowedOrigins").Get<string[]>()
            ?? new[] { "http://localhost:3000" };
        builder_
            .WithOrigins(allowedOrigins)
            .AllowAnyMethod()
            .AllowAnyHeader()
            .AllowCredentials(); // Cần cho SignalR với credentials
    });
});

// Cấu hình xác thực JWT
var key = Encoding.ASCII.GetBytes(builder.Configuration["Jwt:Key"]
    ?? throw new InvalidOperationException("JWT Key is not configured."));
builder.Services.AddAuthentication(x =>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(x =>
{
    x.RequireHttpsMetadata = false; // Chỉ tắt trong phát triển
    x.SaveToken = true;
    x.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(key),
        ValidateIssuer = false,
        ValidateAudience = false
    };
    // Xử lý token cho SignalR
    x.Events = new JwtBearerEvents
    {
        OnMessageReceived = context =>
        {
            var accessToken = context.Request.Query["access_token"];
            var path = context.HttpContext.Request.Path;
            if (!string.IsNullOrEmpty(accessToken) &&
                (path.StartsWithSegments("/chathub") || path.StartsWithSegments("/realtime")))
            {
                context.Token = accessToken;
            }
            return Task.CompletedTask;
        }
    };
});

// Đăng ký dịch vụ
builder.Services.AddScoped<IRoleRepository, RoleRepository>();
builder.Services.AddScoped<IRoleService, RoleService>();
builder.Services.AddScoped<IPromotionRepository, PromotionRepository>();
builder.Services.AddScoped<IPromotionService, PromotionService>();
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IPartnershipRegRepository, PartnershipRegRepository>();
builder.Services.AddScoped<IPartnershipRegService, PartnershipRegService>();
builder.Services.AddScoped<IHomeStayRepository, HomeStayRepository>();
builder.Services.AddScoped<IHomeStayService, HomeStayService>();
builder.Services.AddScoped<IAmenitiesRepository, AmenitiesRepository>();
builder.Services.AddScoped<IAmenitiesService, AmenitiesService>();
builder.Services.AddScoped<IArticleRepository, ArticleRepository>();
builder.Services.AddScoped<IArticleService, ArticleService>();
builder.Services.AddScoped<ICategoryArticleRepository, CategoryArticleRepository>();
builder.Services.AddScoped<ICategoryArticleService, CategoryArticleService>();
builder.Services.AddScoped<IFavoritesRepository, FavoritesRepository>();
builder.Services.AddScoped<IFavoritesService, FavoritesService>();
builder.Services.AddScoped<IReviewAndRatingRepository, ReviewAndRatingRepository>();
builder.Services.AddScoped<IReviewAndRatingService, ReviewAndRatingService>();
builder.Services.AddScoped<IFAQRepository, FAQRepository>();
builder.Services.AddScoped<INotificationRepository, NotificationRepository>();
builder.Services.AddScoped<IRoomService, RoomService>();
builder.Services.AddScoped<IRoomRepository, RoomRepository>();
builder.Services.AddScoped<IFAQService, FAQService>();
builder.Services.AddScoped<IPaymentRepository, PaymentRepository>();
builder.Services.AddScoped<IPaymentService, PaymentService>();
builder.Services.AddScoped<IBookingRepository, BookingRepository>();
builder.Services.AddScoped<IBookingService, BookingService>();
builder.Services.AddScoped<ISendMaillService, SendMaillService>();
builder.Services.AddScoped<PaymentMomoService>();
builder.Services.AddScoped<ExportExcel>();

builder.Services.AddSignalR();

var app = builder.Build();

// Cấu hình pipeline
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseStaticFiles();

// Chỉ sử dụng HTTPS trong sản xuất
if (!app.Environment.IsDevelopment())
{
    app.UseHttpsRedirection();
}

// Áp dụng chính sách CORS
app.UseCors("AllowFrontend");

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();
app.MapHub<MyHub>("/realtime");
app.MapHub<ChatHub>("/chathub");

app.Run();