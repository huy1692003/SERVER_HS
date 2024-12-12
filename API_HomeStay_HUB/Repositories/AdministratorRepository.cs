using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Repositories
{
    public class  AdministratorRepository:IAdministratorRepository
    {
        private DBContext _dbContext;
        public AdministratorRepository(DBContext _db)
        {
            this._dbContext = _db;
        }
        public async Task<Administrator?> login(string username, string password)
        {
            var administrator =await  (from admin in _dbContext.Administrators 
                                       join user in _dbContext.Users
                                       on admin.UserID equals user.UserID
                                       where user.Username==username && user.Password==password
                                       select new Administrator
                                       {
                                           User=user,                                           
                                           AdminID=admin.AdminID,
                                           UserID=admin.UserID,
                                           RoleID=admin.RoleID,
                                       }).FirstOrDefaultAsync();

            if (administrator != null && administrator.User!=null)
            {
                administrator.User.Password = null;
            }
            return administrator;
        }
    }
}
