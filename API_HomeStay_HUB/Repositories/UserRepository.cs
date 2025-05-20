using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Intefaces;
using Microsoft.EntityFrameworkCore;
using System;


namespace API_HomeStay_HUB.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly DBContext _context;

        public UserRepository(DBContext _context)
        {
            this._context = _context;

        }
        public async Task<User?> loginUser(string username, string password)
        {
            var user = await _context.Users.FirstOrDefaultAsync(s => s.Username == username && s.TypeUser>0 && s.Status==1);
            if (user != null && BCrypt.Net.BCrypt.Verify(password, user.Password))
            {
                var cus=_context.Customers.FirstOrDefault(c=>c.UserID==user.UserID);
                user.Customer = cus!;
                if(user.TypeUser==1)
                {
                    var ownerStay = _context.OwnerStays.FirstOrDefault(c => c.UserID == user.UserID);
                    user.OwnerStay = ownerStay!;
                }

                return user;
            }
            return null;
        }
        public async Task<User?> loginAdmin(string username, string password)
        {
            var user = await _context.Users.FirstOrDefaultAsync(s => s.Username == username && s.TypeUser == 0 && s.Status==1);
            if (user != null && BCrypt.Net.BCrypt.Verify(password, user.Password))
            {
                var admin = await _context.Administrators.FirstOrDefaultAsync(a => a.UserID == user.UserID);
                user.Administrator = admin!;
                return user;
            }
            return null;
        }

        public async Task<bool> addUser(User user, int typeUser , string roleID )
        {
            var userDB = await _context.Users.SingleOrDefaultAsync(u => u.Username == user.Username);
            if (userDB == null)
            {

                string userID_guid = Guid.NewGuid().ToString();
                user.UserID = userID_guid;
                user.Status = 1;
                user.TypeUser = typeUser;
                user.Password = BCrypt.Net.BCrypt.HashPassword(user.Password);
                await _context.Users.AddAsync(user);
                bool isCreated = await _context.SaveChangesAsync() > 0;

                if (isCreated)
                {
                    string guid = Guid.NewGuid().ToString();                   
                    await _context.Customers.AddAsync(new Customer { CusID = guid, UserID = userID_guid });
                    

                    // Lưu các thay đổi vào cơ sở dữ liệu
                    return await _context.SaveChangesAsync() > 0;
                }
                else
                {
                    return false;
                }
            }
            return false;


        }
        public async Task<bool> addAdmin(RegisterAdminDTO res)
        {
            var userDB = await _context.Users.SingleOrDefaultAsync(u => u.Username == res!.Username);
            if (userDB == null)
            {

                string userID_guid = Guid.NewGuid().ToString();
                res!.UserID = userID_guid;

                res.Status = 1;
                res.TypeUser = 0;
                res.Password = BCrypt.Net.BCrypt.HashPassword(res.Password);
                await _context.Users.AddAsync(res);
                bool isCreated = await _context.SaveChangesAsync() > 0;

                if (isCreated)
                {
                    string guid = Guid.NewGuid().ToString();
                   
                    await _context.Administrators.AddAsync(new Administrator { AdminID = guid, UserID = userID_guid, RoleID = res.roleID });                   

                    // Lưu các thay đổi vào cơ sở dữ liệu
                    return await _context.SaveChangesAsync() > 0;
                }
                else
                {
                    return false;
                }
            }
            return false;


        }

        public async Task<bool> changePassWord(string userID, string passOld, string passNew)
        {
            var user = await _context.Users.FindAsync(userID);
            if (user == null)
            {
                return false;
            }
            else
            {
                if (BCrypt.Net.BCrypt.Verify(passOld, user.Password))
                {
                    user.Password = BCrypt.Net.BCrypt.HashPassword(passNew);
                    return await _context.SaveChangesAsync() > 0;
                }
                return false;

            }


        }

        public async Task<OwnerStay> GetDetailOwnerStay(string ownerID)
        {
            var ownerStay = await _context.OwnerStays.FirstOrDefaultAsync(s => s.OwnerID == ownerID);
            if (ownerStay != null)
            {
                ownerStay.User = await getProfileByIDUser(ownerStay.UserID!);
                return ownerStay;
            }
            return null;
        }
        public async Task<User?> getProfileByIDUser(string userID)
        {
            var user =  await _context.Users.FirstOrDefaultAsync(s => s.UserID == userID);
            if (user != null)
            {
                var admin = _context.Administrators.FirstOrDefault(a => a.UserID == user.UserID);
                user.Administrator = admin!;
                return user;
            }
            return null;
        }
        public async Task<bool> updateProfile(User user)
        {
            var _user = await _context.Users.FindAsync(user.UserID);
            if (user == null)
            {
                return false;
            }
            else
            {
                _context.Users.Update(user);
                return _context.SaveChanges() > 0;
            }
        }
        public async Task<bool> lockUser(User user)
        {
            return false;
        }
    }
}
