using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;

namespace API_HomeStay_HUB.Services.Interface
{
    public interface IHomeStayService
    {
        Task<IEnumerable<HomeStayResDTO?>> getHomeStay();
        Task<IEnumerable<HomeStayResDTO?>> getHomeStayViewHight();
        Task<PagedResultDTO<HomeStayResDTO?>> searchHomeStayByCustomer(SearchHomeStayDTO search, PaginateDTO paginate);
        Task<HomeStayDetailDTO?> getHomeStayByID(int ID);
        Task<bool> addHomeStay(HomeStayReqDTO homeStay);
        Task<bool> updateHomeStay(HomeStayReqDTO homeStay);
        Task<bool> deleteHomeStay(int ID);
        Task<bool> lockHomeStay(int ID);
        Task<IEnumerable<Service>> GetAllServices();
        Task<Service?> GetServiceById(int id);
        Task<bool> AddService(Service service);
        Task<bool> UpdateService(Service service);
        Task<bool> DeleteService(int id);
    }
}
