using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Intefaces;
using API_HomeStay_HUB.Repositories.Interfaces;
using API_HomeStay_HUB.Services.Interface;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Services
{
    public class HomeStayService : IHomeStayService
    {
        private readonly IHomeStayRepository _homeStayRepository;

        public HomeStayService(IHomeStayRepository homeStayRepository)
        {
            _homeStayRepository = homeStayRepository;
        }
        
        public async Task<IEnumerable<HomeStayResDTO?>> getHomeStay()
        {
            return await _homeStayRepository.getHomeStay();
        }
        
        public async Task<IEnumerable<HomeStayResDTO?>> getHomeStayViewHight()
        {
            return await _homeStayRepository.getHomeStayViewHight();
        }
        
        public async Task<PagedResultDTO<HomeStayResDTO?>> searchHomeStayByCustomer(SearchHomeStayDTO search, PaginateDTO paginate)
        {
            return await _homeStayRepository.searchHomeStayByCustomer(search, paginate);
        }
        
        public async Task<HomeStayDetailDTO?> getHomeStayByID(int ID)
        {
            return await _homeStayRepository.getHomeStayByID(ID);
        }
        
        public async Task<bool> addHomeStay(HomeStayReqDTO homeStay)
        {
            return await _homeStayRepository.addHomeStay(homeStay);
        }
        
        public async Task<bool> updateHomeStay(HomeStayReqDTO homeStay)
        {
            return await _homeStayRepository.updateHomeStay(homeStay);
        }
        
        public async Task<bool> deleteHomeStay(int ID)
        {
            return await _homeStayRepository.deleteHomeStay(ID);
        }
        
        public async Task<bool> lockHomeStay(int ID)
        {
            return await _homeStayRepository.deleteHomeStay(ID);
        }
        
        public async Task<IEnumerable<Service>> GetAllServices(string idOwner)
        {
            return await _homeStayRepository.GetAllServices(idOwner);
        }

        public async Task<Service?> GetServiceById(int id)
        {
            return await _homeStayRepository.GetServiceById(id);
        }

        public async Task<bool> AddService(Service service)
        {
            return await _homeStayRepository.AddService(service);
        }

        public async Task<bool> UpdateService(Service service)
        {
            return await _homeStayRepository.UpdateService(service);
        }

        public async Task<bool> DeleteService(int id)
        {
            return await _homeStayRepository.DeleteService(id);
        }
    }
}
