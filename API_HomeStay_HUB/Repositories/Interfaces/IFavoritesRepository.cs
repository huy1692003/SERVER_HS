namespace API_HomeStay_HUB.Repositories.Interfaces
{
    public interface IFavoritesRepository
    {
        Task<bool> addFavorites(int idHomeStay, string idCus);
        Task<bool> deleteFavorites(int id);
        Task<IEnumerable<dynamic>> getHomeStay_Favorites(string idCus);
    }
}
