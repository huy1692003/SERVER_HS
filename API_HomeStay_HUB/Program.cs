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

// Add services to the container.
// Sử dụng file tĩnh từ thư mục wwwroot
builder.Services.Configure<MomoOptionModel>(builder.Configuration.GetSection("MomoAPI"));

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<DBContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

var key = Encoding.ASCII.GetBytes(builder.Configuration["Jwt:Key"]);
builder.Services.AddAuthentication(x =>
{
    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(x =>
{
    x.RequireHttpsMetadata = false;
    x.SaveToken = true;
    x.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(key),
        ValidateIssuer = false,
        ValidateAudience = false
    };
});
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

builder.Services.AddScoped<IFAQService, FAQService>();
builder.Services.AddScoped<IPaymentRepository, PaymentRepository>();
builder.Services.AddScoped<IPaymentService, PaymentService>();
builder.Services.AddScoped<IBookingRepository, BookingRepository>();
builder.Services.AddScoped<IBookingService, BookingService>();
builder.Services.AddScoped<ISendMaillService, SendMaillService>();
builder.Services.AddScoped<PaymentMomoService>();
builder.Services.AddScoped<ExportExcel>();



// Cấu hình CORS
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowSpecificOrigins",
        policy => policy
            .WithOrigins("http://localhost:3000") // URL của client
            .AllowAnyMethod()
            .AllowAnyHeader()
            .AllowCredentials()); // Dùng AllowCredentials nếu client sử dụng cookie hoặc thông tin xác thực
});

builder.Services.AddSignalR();
var app = builder.Build();


//Endpoint realtime



// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseStaticFiles();

app.UseHttpsRedirection();

// Sử dụng CORS
app.UseCors("AllowSpecificOrigins"); ; // Đảm bảo middleware này được sử dụng

app.UseAuthorization();

app.MapControllers();
app.MapHub<MyHub>("/realtime");
app.MapHub<ChatHub>("/chathub");
app.Run();
