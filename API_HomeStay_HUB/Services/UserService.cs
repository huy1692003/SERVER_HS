using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Intefaces;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace API_HomeStay_HUB.Services
{
    public class UserService : IUserService
    {
        private IUserRepository _userRepository;
        private IConfiguration _configuration;
        public UserService(IConfiguration configuration, IUserRepository userRepository)
        {
            _configuration = configuration;
            _userRepository = userRepository;
        }
        public Task<bool> addUser(User user, int typeUser, string roleID="")
        {
            return _userRepository.addUser(user, typeUser ,roleID);
        } 
        public Task<bool> addAdmin(RegisterAdminDTO res)
        {
            return _userRepository.addAdmin(res);
        }
        public Task<bool> changePassWord(string userID, string passOld, string passNew)
        {
            return _userRepository.changePassWord(userID, passOld, passNew);
        }
        public Task<bool> updateProfile(User user)
        {
            return _userRepository.updateProfile(user);
        }
        public Task<bool> lockUser(User user)
        {
            return _userRepository.lockUser(user);
        }
        public async Task<LoginUserResDTO?> loginUser(string username, string password)
        {
            var user = await _userRepository.loginUser(username, password);
            if (user != null)
            {
                var tokenUser = GenerateJwtToken(user);

                return new LoginUserResDTO { Username = user.Username, idCus = user.Customer!.CusID, idOwner = user.OwnerStay !=null? user.OwnerStay.OwnerID:null, TokenUser = tokenUser , Fullname=user.FullName , idUser=user.UserID }; 

            }
            return null;

        }
        public async Task<LoginUserResDTO?> loginAdmin(string username, string password)
        {
            var user = await _userRepository.loginAdmin(username, password);
            if (user != null)
            {
                var tokenUser = GenerateJwtToken(user);

                return new LoginUserResDTO { Username = user.Username, TokenUser = tokenUser ,idAdmin=user.Administrator!.AdminID , roleID=user.Administrator.RoleID ,Fullname=user.FullName ,idUser =user.UserID};
            }
            return null;
        }

        private string GenerateJwtToken(User user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_configuration["Jwt:Key"]!);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                new Claim(ClaimTypes.NameIdentifier, user.UserID!.ToString()),
                new Claim(ClaimTypes.Name, user.Username!)
                }),
                Expires = DateTime.UtcNow.AddHours(2),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}
