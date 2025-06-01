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
            if(homeStay.HomeStay?.LinkGoogleMap != null)
            {
                homeStay.HomeStay.LinkGoogleMap = await GetGoogleMapsEmbedUrlAsync(homeStay.HomeStay.LinkGoogleMap);
            }
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

        public static async Task<string> GetGoogleMapsEmbedUrlAsync(string inputUrl)
        {
            if (string.IsNullOrWhiteSpace(inputUrl))
                return null;

            // Nếu đã là link embed thì trả về luôn
            if (inputUrl.StartsWith("https://www.google.com/maps/embed"))
                return inputUrl;

            // Nếu là link đầy đủ maps (chưa phải embed), thì convert
            if (inputUrl.StartsWith("https://www.google.com/maps"))
            {
                return ConvertToEmbedUrl(inputUrl);
            }

            // Nếu là link rút gọn maps.app.goo.gl thì resolve redirect
            if (inputUrl.StartsWith("https://maps.app.goo.gl"))
            {
                try
                {
                    using (var handler = new HttpClientHandler
                    {
                        AllowAutoRedirect = false
                    })
                    using (var client = new HttpClient(handler))
                    {
                        var response = await client.GetAsync(inputUrl);
                        if (response.StatusCode == System.Net.HttpStatusCode.Redirect ||
                            response.StatusCode == System.Net.HttpStatusCode.MovedPermanently ||
                            response.StatusCode == System.Net.HttpStatusCode.Found)
                        {
                            var fullUrl = response.Headers.Location?.ToString();
                            if (!string.IsNullOrWhiteSpace(fullUrl))
                            {
                                return ConvertToEmbedUrl(fullUrl);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Lỗi khi truy cập URL rút gọn: " + ex.Message);
                }
            }

            return null;
        }


        private static string ConvertToEmbedUrl(string fullUrl)
        {
            if (string.IsNullOrEmpty(fullUrl)) return null;

            // Chuyển URL Google Maps gốc sang dạng embed
            if (fullUrl.StartsWith("https://www.google.com/maps"))
            {
                string embedPath = fullUrl.Replace("https://www.google.com/maps", "");
                return $"https://www.google.com/maps/embed{embedPath}";
            }

            return null;
        }
    }
}
