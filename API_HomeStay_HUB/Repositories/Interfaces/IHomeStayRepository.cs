using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.Repositories.Intefaces
{
    public interface IHomeStayRepository
    {
        Task<IEnumerable<HomeStayResDTO?>> getHomeStay();
        Task<PagedResultDTO<HomeStayResDTO?>> searchHomeStayByCustomer(SearchHomeStayDTO search, PaginateDTO paginate);
        Task<HomeStayDetailDTO?> getHomeStayByID(int ID);
        Task<bool> addHomeStay(HomeStayReqDTO homeStay);
        Task<bool> updateHomeStay(HomeStayReqDTO homeStay);
        Task<bool> deleteHomeStay(int ID);
        Task<bool> lockHomeStay(int ID);

        Task<IEnumerable<HomeStayResDTO?>> getHomeStayViewHight();


    }
}
