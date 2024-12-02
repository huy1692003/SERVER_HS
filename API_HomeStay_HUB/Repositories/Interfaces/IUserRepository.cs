﻿using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.Repositories.Intefaces
{
    public interface IUserRepository
    {
        Task<bool> addUser(User user, int typeUser);
        Task<bool> changePassWord(string userID, string passOld, string passNew);
        Task<bool> updateProfile(User user);
        Task<bool> lockUser(User user);
        Task<User?> loginUser(string username, string password);
        Task<User?> loginAdmin(string username, string password);

    }
}
