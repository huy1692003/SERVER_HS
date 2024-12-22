using System.Linq;
using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.DTOs;
using API_HomeStay_HUB.Helpers;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Intefaces;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Repositories
{
    public class HomeStayRepository : IHomeStayRepository
    {
        private readonly DBContext _dBContext;
        public HomeStayRepository(DBContext dBContext)
        {
            _dBContext = dBContext;
        }
        public async Task<IEnumerable<HomeStayResDTO?>> getHomeStay()
        {
            var data = await (from HomeStay in _dBContext.HomeStays
                              join DetailHomeStay in _dBContext.DetailHomeStays
                              on HomeStay.HomestayID equals DetailHomeStay.HomestayID
                              select new HomeStayResDTO
                              {
                                  HomeStay = HomeStay,
                                  DetailHomeStay = DetailHomeStay,
                              }).ToListAsync();
            return data;
        }

        public async Task<IEnumerable<HomeStayResDTO?>> getHomeStayViewHight()
        {
            var data = await (from HomeStay in _dBContext.HomeStays
                              join DetailHomeStay in _dBContext.DetailHomeStays
                              on HomeStay.HomestayID equals DetailHomeStay.HomestayID
                              where HomeStay.ApprovalStatus == 1
                              orderby HomeStay.TotalView descending
                              select new HomeStayResDTO
                              {
                                  HomeStay = HomeStay,
                                  DetailHomeStay = DetailHomeStay,
                              }).Take(20).ToListAsync();
            return data;
        }

        public async Task<PagedResultDTO<HomeStayResDTO?>> searchHomeStayByCustomer(SearchHomeStayDTO search, PaginateDTO paginate)
        {
            double PriceStart = 0, PriceEnd = 0;
            if (!string.IsNullOrEmpty(search.PriceRange))
            {
                string[] PriceString = search.PriceRange.Split("-");
                PriceStart = double.Parse(PriceString[0]);
                PriceEnd = double.Parse(PriceString[1]);
            }

            // Lấy danh sách các homestay khả dụng trong khoảng thời gian tìm kiếm
            var availableHomeStayIds = await GetAvailableHomeStays(search.DateIn, search.DateOut);

            // Truy vấn tổng hợp
            var query = from HomeStay in _dBContext.HomeStays
                        join DetailHomeStay in _dBContext.DetailHomeStays
                        on HomeStay.HomestayID equals DetailHomeStay.HomestayID
                        where availableHomeStayIds.Contains(HomeStay.HomestayID)
                        &&
                        (search.Location == null ||
                            HomeStay.AddressDetail!.Contains(search.Location!) ||
                            HomeStay.Country!.Contains(search.Location!) ||
                            HomeStay.Province!.Contains(search.Location!) ||
                            HomeStay.District!.Contains(search.Location!)
                        )
                        && (search.Name == null ||
                            HomeStay.HomestayName!.Contains(search.Name!))
                        && (search.NumberofGuest == null ||
                            (search.NumberofGuest >= HomeStay.MinPerson && search.NumberofGuest <= HomeStay.MaxPerson)
                        )
                        && (string.IsNullOrEmpty(search.PriceRange) ||
                            (HomeStay.PricePerNight >= PriceStart && HomeStay.PricePerNight <= PriceEnd)
                        )
                        && (search.NumberOfBathrooms == null ||
                            DetailHomeStay.NumberOfBathrooms == search.NumberOfBathrooms
                        )
                        && (search.NumberOfLivingRooms == null ||
                            DetailHomeStay.NumberOfLivingRooms == search.NumberOfLivingRooms
                        )
                        && (search.NumberOfBedrooms == null ||
                            DetailHomeStay.NumberOfBedrooms == search.NumberOfBedrooms
                        )
                        && (search.NumberOfKitchens == null ||
                            DetailHomeStay.NumberOfKitchens == search.NumberOfKitchens
                        )
                        // Lọc theo danh sách amenities
                        && (search.Amenties == null || search.Amenties.Count == 0 ||
                            (from amenity in _dBContext.HomeStayAmenities
                             where amenity.HomestayID == HomeStay.HomestayID &&
                                   search.Amenties.Contains(amenity.AmenityID)
                             select amenity
                            ).Distinct().Count() == search.Amenties.Count
                        )
                        select new HomeStayResDTO
                        {
                            HomeStay = HomeStay,
                            DetailHomeStay = DetailHomeStay,
                        };

            // Tính tổng số bản ghi
            int totalRecords = await query.CountAsync();

            // Lấy dữ liệu phân trang
            var data = await query
                        .Skip((paginate.Page - 1) * paginate.PageSize)
                        .Take(paginate.PageSize)
                        .ToListAsync();

            // Trả về dữ liệu cùng với tổng số bản ghi
            return new PagedResultDTO<HomeStayResDTO?>
            {
                Items = data,
                TotalCount = totalRecords
            };
        }



        public async Task<IEnumerable<int?>> GetAvailableHomeStays(DateTime? dateIn, DateTime? dateOut)
        {
            // Trả về tất cả HomeStays nếu không có ngày vào hoặc ngày ra
            if (dateIn == null || dateOut == null)
            {
                return await _dBContext.HomeStays.Select(h => h.HomestayID).ToListAsync();
            }

            // Tạo một truy vấn cho các booking bị trùng lịch
            var homestayIdsQuery = _dBContext.HomeStays.AsQueryable();

            // Truy vấn Bookings không bị hủy
            var filteredBookingsQuery = _dBContext.Bookings
                .Where(bk => bk.IsCancel != 1);  // Không cần gọi ToList(), giữ lại IQueryable

            // Lọc các booking trùng lịch với dateIn và dateOut
            filteredBookingsQuery = filteredBookingsQuery
                .Where(bk => dateIn.Value.Date < bk.CheckOutDate.Date &&
                             dateOut.Value.Date.AddDays(1) > bk.CheckInDate.Date);

            // Lọc HomeStays không bị trùng lịch
            homestayIdsQuery = homestayIdsQuery
                .Where(hs => !filteredBookingsQuery.Any(bk => bk.HomeStayID == hs.HomestayID));

            // Lấy danh sách các HomeStayID có sẵn
            var availableHomeStayIds = await homestayIdsQuery.Select(hs => hs.HomestayID).ToListAsync();

            return availableHomeStayIds;
        }




        public async Task<HomeStayDetailDTO?> getHomeStayByID(int ID)
        {
            var data = await (from hs in _dBContext.HomeStays
                              join dtH in _dBContext.DetailHomeStays
                              on hs.HomestayID equals dtH.HomestayID
                              where hs.HomestayID == ID
                              select new HomeStayDetailDTO
                              {
                                  HomeStay = hs,  // Thông tin Homestay
                                  DetailHomeStay = dtH,  // Thông tin chi tiết homestay

                                  // Lấy danh sách HomeStayAmenities (tối ưu: không cần check lại ID)
                                  HomeStayAmenities = (from hsA in _dBContext.HomeStayAmenities
                                                       where hsA.HomestayID == hs.HomestayID
                                                       select hsA).ToList(),

                                  // Lấy danh sách Amenities dựa trên HomeStayAmenities
                                  Amenities = (from hsA in _dBContext.HomeStayAmenities
                                               join amen in _dBContext.Amenities
                                               on hsA.AmenityID equals amen.AmenityID
                                               where hsA.HomestayID == hs.HomestayID
                                               select amen).ToList()
                              }).FirstOrDefaultAsync();
            var owner = await _dBContext.OwnerStays.FirstOrDefaultAsync(s => s.OwnerID == data.HomeStay.OwnerID);
            if(owner != null)
            {
                var user =await _dBContext.Users.FirstOrDefaultAsync(s => s.UserID == owner.UserID);
                data.idUserOwner = user.UserID;
                data.UserNameOwner = user.Username;
            }    

            return data;
        }


        public async Task<bool> addHomeStay(HomeStayReqDTO req)
        {
            req.HomeStay!.HomestayID = null;
            req.HomeStay!.ApprovalStatus = 0;
            req.HomeStay!.CreatedAt = TimeHelper.GetDateTimeVietnam();
            req.HomeStay!.IsLocked = 0;
            req.HomeStay.TotalView = 0;
            //Tạo HomeStay và trả về HomeStay đó
            var hsCreated = await _dBContext.HomeStays.AddAsync(req.HomeStay);
            await _dBContext.SaveChangesAsync();

            if (hsCreated.Entity != null)
            {
                //Tạo chi tiết HomeStay đó
                req.DetailHomeStay!.HomestayID = hsCreated.Entity.HomestayID;
                req.DetailHomeStay.ID = null;
                await _dBContext.DetailHomeStays.AddAsync(req.DetailHomeStay);

                //Tạo danh sách các tiện nghi liên Quan đến HomeStay đó 
                foreach (var idAmen in req.ListAmenities!)
                {
                    var homeStayAmenity = new HomeStayAmenities
                    {
                        id = GenerateRandomId(),
                        HomestayID = hsCreated.Entity.HomestayID,
                        AmenityID = idAmen
                    };

                    await _dBContext.HomeStayAmenities.AddAsync(homeStayAmenity);
                }
                return await _dBContext.SaveChangesAsync() > 0;

            }
            return false;

        }
        private int GenerateRandomId()
        {
            DateTime now = DateTime.Now;
            // Lấy mili giây từ thời gian hiện tại và chuyển đổi nó thành số nguyên
            return (int)(now.Ticks % int.MaxValue); // Sử dụng modulo để đảm bảo trong giới hạn int
        }

        public async Task<bool> updateHomeStay(HomeStayReqDTO req)
        {
            try
            {
                // Tìm đối tượng HomeStay trong cơ sở dữ liệu

                var existingHomeStay = await _dBContext.HomeStays.FindAsync(req.HomeStay!.HomestayID);
                req.HomeStay.ApprovalStatus = 0;
                _dBContext.Entry(existingHomeStay!).CurrentValues.SetValues(req.HomeStay);

                if (req.DetailHomeStay != null)
                {
                    //Cập nhật chi tiết Homestay
                    var existingDetail = await _dBContext.DetailHomeStays.FirstOrDefaultAsync(d => d.HomestayID == req.HomeStay.HomestayID);
                    req.DetailHomeStay.ID = existingDetail!.ID;
                    req.DetailHomeStay.HomestayID = existingDetail.HomestayID;
                    _dBContext.Entry(existingDetail!).CurrentValues.SetValues(req.DetailHomeStay);

                }

                // Cập nhật các tiện nghi của HomeStay
                if (req.ListAmenities != null && req.ListAmenities.Any())
                {
                    // Xóa tất cả tiện nghi cũ trước khi thêm mới
                    var existingAmenities = await _dBContext.HomeStayAmenities
                                                             .Where(hsa => hsa.HomestayID == req.HomeStay.HomestayID)
                                                             .ToListAsync();

                    _dBContext.HomeStayAmenities.RemoveRange(existingAmenities);
                    await _dBContext.SaveChangesAsync();
                    // Thêm các tiện nghi mới
                    var newHomeStayAmenities = req.ListAmenities.Select(amenityID => new HomeStayAmenities
                    {
                        id = GenerateRandomId(),
                        HomestayID = req.HomeStay.HomestayID,
                        AmenityID = amenityID
                    }).ToList();

                    await _dBContext.HomeStayAmenities.AddRangeAsync(newHomeStayAmenities);
                }

                // Lưu thay đổi vào cơ sở dữ liệu
                return await _dBContext.SaveChangesAsync() > 0;
            }
            catch (Exception ex)
            {

                return false;
            }
        }


        public async Task<bool> deleteHomeStay(int ID)
        {
            var homestay = await _dBContext.HomeStays.FindAsync(ID);
            if (homestay != null)
            {
                _dBContext.HomeStays.Remove(homestay);
                return await _dBContext.SaveChangesAsync() > 0;
            }
            return false;
        }
        public async Task<bool> lockHomeStay(int ID)
        {
            var homestay = await _dBContext.HomeStays.FindAsync(ID);
            if (homestay != null)
            {
                homestay.IsLocked = 1;
                _dBContext.HomeStays.Update(homestay);
                return await _dBContext.SaveChangesAsync() > 0;
            }
            return false;

        }
    }
}
