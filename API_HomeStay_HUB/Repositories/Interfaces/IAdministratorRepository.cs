using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.Repositories
{
    public interface IAdministratorRepository
    {
        Task<Administrator?> login(string username, string password);
    }
}
