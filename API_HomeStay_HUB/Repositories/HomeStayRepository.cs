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
                              join Room in _dBContext.Rooms
                                on HomeStay.HomestayID equals Room.HomestayId
                              where HomeStay.StatusHomestay == 1
                              orderby HomeStay.ViewCount descending
                              select new HomeStayResDTO
                              {
                                  HomeStay = HomeStay,
                                  DetailHomeStay = DetailHomeStay,
                                  Rooms=_dBContext.Rooms.Where(s=>s.HomestayId==HomeStay.HomestayID).ToList(),
                              }).Take(20).ToListAsync();
            return data;
        }

        public async Task<PagedResultDTO<HomeStayResDTO?>> searchHomeStayByCustomer(SearchHomeStayDTO search, PaginateDTO paginate)
        {
            double PriceStart = 0, PriceEnd = 0, RoomSizeStart = 0, RoomSizeEnd = 0;
            if (!string.IsNullOrEmpty(search.PriceRange))
            {
                string[] PriceString = search.PriceRange.Split("-");
                PriceStart = double.Parse(PriceString[0]);
                PriceEnd = double.Parse(PriceString[1]);
            }
            if(!string.IsNullOrEmpty(search.RoomSize))
            {
                string[] RoomSizeString = search.RoomSize.Split("-");
                RoomSizeStart = double.Parse(RoomSizeString[0]);
                RoomSizeEnd = double.Parse(RoomSizeString[1]);
            }

            // Lấy danh sách các homestay khả dụng trong khoảng thời gian tìm kiếm
            var availableHomeStayIds = await GetAvailableByDate(search);
            
            // Truy vấn tổng hợp
            var query = from HomeStay in _dBContext.HomeStays
                        join DetailHomeStay in _dBContext.DetailHomeStays
                        on HomeStay.HomestayID equals DetailHomeStay.HomestayID

                        where availableHomeStayIds.Contains(HomeStay.HomestayID)
                        &&
                        (string.IsNullOrEmpty(search.Location) ||
                            HomeStay.AddressDetail.Contains(search.Location) ||
                            HomeStay.Country.Contains(search.Location) ||
                            (HomeStay.Province != null && HomeStay.Province.Contains(search.Location)) ||
                            (HomeStay.District != null && HomeStay.District.Contains(search.Location))
                        )
                       
                        && (string.IsNullOrEmpty(search.Name) ||
                            HomeStay.HomestayName.Contains(search.Name))
                        && (search.NumberAdults <= 0 || _dBContext.Rooms.Any(r => 
                            r.HomestayId == HomeStay.HomestayID && 
                            r.MaxAdults >= search.NumberAdults &&
                            (search.NumberChildren <= 0 || r.MaxChildren >= search.NumberChildren) &&
                            (search.NumberBaby <= 0 || r.MaxBaby >= search.NumberBaby)
                        ))
                        // Lọc theo danh sách amenities
                        && (search.Amenities == null || search.Amenities.Count == 0 ||
                            (from amenity in _dBContext.HomeStayAmenities
                             where amenity.HomestayID == HomeStay.HomestayID &&
                                   search.Amenities.Contains(amenity.AmenityID)
                             select amenity
                            ).Distinct().Count() >= search.Amenities.Count
                        )
                        // Lọc theo tiện nghi phòng
                        && (!search.HasBalcony.HasValue || _dBContext.Rooms.Any(r => 
                            r.HomestayId == HomeStay.HomestayID && r.HasBalcony == search.HasBalcony))
                        && (string.IsNullOrEmpty(search.HomeStayType) || _dBContext.Rooms.Any(r =>
                            r.HomestayId == HomeStay.HomestayID && r.RoomType == search.HomeStayType))
                        && (!search.HasTv.HasValue || _dBContext.Rooms.Any(r => 
                            r.HomestayId == HomeStay.HomestayID && r.HasTv == search.HasTv))
                        && (!search.HasAirConditioner.HasValue || _dBContext.Rooms.Any(r => 
                            r.HomestayId == HomeStay.HomestayID && r.HasAirConditioner == search.HasAirConditioner))
                        && (!search.HasRefrigerator.HasValue || _dBContext.Rooms.Any(r => 
                            r.HomestayId == HomeStay.HomestayID && r.HasRefrigerator == search.HasRefrigerator))
                        && (!search.HasWifi.HasValue || _dBContext.Rooms.Any(r => 
                            r.HomestayId == HomeStay.HomestayID && r.HasWifi == search.HasWifi))
                        && (!search.HasHotWater.HasValue || _dBContext.Rooms.Any(r => 
                            r.HomestayId == HomeStay.HomestayID && r.HasHotWater == search.HasHotWater))
                        && (!search.NumberOfBeds.HasValue || _dBContext.Rooms.Any(r => 
                            r.HomestayId == HomeStay.HomestayID && r.BedCount >= search.NumberOfBeds))
                        && (!search.BathroomCount.HasValue || _dBContext.Rooms.Any(r => 
                            r.HomestayId == HomeStay.HomestayID && r.BathroomCount >= search.BathroomCount))
                        && (string.IsNullOrEmpty(search.RoomSize) || _dBContext.Rooms.Any(r => 
                            r.HomestayId == HomeStay.HomestayID && r.RoomSize >= RoomSizeStart && r.RoomSize <= RoomSizeEnd))
                        // Lọc theo đánh giá
                        && (!search.Rating.HasValue || HomeStay.AverageRating >= search.Rating)
                        // Lọc theo khoảng giá
                        && (string.IsNullOrEmpty(search.PriceRange) || _dBContext.Rooms.Any(r => 
                            r.HomestayId == HomeStay.HomestayID && 
                            r.PricePerNight >= PriceStart && r.PricePerNight <= PriceEnd))
                        // Lọc theo các tiện ích bổ sung
                        && (!search.HasPool.HasValue || DetailHomeStay.HasSwimmingPool == search.HasPool)
                        && (!search.HasGarden.HasValue || DetailHomeStay.SpaciousGarden == search.HasGarden)
                        // Lọc theo cảnh quan
                        && (!search.HasLakeView.HasValue || DetailHomeStay.LakeView == search.HasLakeView)
                        && (!search.HasMountainView.HasValue || DetailHomeStay.MountainView == search.HasMountainView)
                        && (!search.HasSeaView.HasValue || DetailHomeStay.SeaView == search.HasSeaView)
                        && (!search.HasRiceFieldView.HasValue || DetailHomeStay.RiceFieldView == search.HasRiceFieldView)
                        // Lọc theo tính năng bổ sung
                        && (!search.HasBilliardTable.HasValue || DetailHomeStay.HasBilliardTable == search.HasBilliardTable)
                        && (!search.HasManyActivities.HasValue || DetailHomeStay.ManyActivities == search.HasManyActivities)
                        && (!search.HasSpaciousGarden.HasValue || DetailHomeStay.SpaciousGarden == search.HasSpaciousGarden)
                        select new HomeStayResDTO
                        {
                            HomeStay = HomeStay,
                            DetailHomeStay = DetailHomeStay,
                            Rooms = _dBContext.Rooms.Where(r => r.HomestayId == HomeStay.HomestayID).ToList()
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



        public async Task<IEnumerable<int?>> GetAvailableByDate(SearchHomeStayDTO search)
        {
            // Trả về tất cả HomeStays nếu không có ngày vào hoặc ngày ra
            if (search.DateIn == null || search.DateOut == null)
            {
                return await _dBContext.HomeStays.Where (s=>s.StatusHomestay == 1).Select(h => h.HomestayID).ToListAsync();
            }

            var homestayIdsQuery = _dBContext.HomeStays.AsQueryable();

            // Lấy danh sách các phòng đã được đặt trong khoảng thời gian
            var filteredBookingsQuery = _dBContext.Bookings
                .Where(bk => !bk.IsCancel && bk.IsConfirm)
                .Where(bk => search.DateIn.Value.Date <= bk.CheckOutDate.Date &&
                             search.DateOut.Value.Date >= bk.CheckInDate.Date);

            var bookedRoomIDs = await filteredBookingsQuery
                .Select(bk => bk.RoomID)
                .Distinct()
                .ToListAsync();

            // Truy vấn các homestay có ít nhất một phòng không bị đặt
            var availableHomeStayIds = await _dBContext.HomeStays
                .Where(hs => _dBContext.Rooms
                    .Any(r => r.HomestayId == hs.HomestayID && !bookedRoomIDs.Contains(r.RoomId))&&
                    hs.StatusHomestay == 1)

                .Select(hs => hs.HomestayID)
                .ToListAsync();

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
                                  Rooms= _dBContext.Rooms.Where(r => r.HomestayId == hs.HomestayID).ToList(),
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
                data.Rooms = await _dBContext.Rooms.Where(s => s.HomestayId == ID).ToListAsync();
            }    

            return data;
        }


        public async Task<bool> addHomeStay(HomeStayReqDTO req)
        {
            using var transaction = await _dBContext.Database.BeginTransactionAsync();
            try
            {
                // Chuẩn bị dữ liệu HomeStay
                req.HomeStay!.HomestayID = null;
                req.HomeStay!.StatusHomestay = 0;
                req.HomeStay!.CreatedAt = TimeHelper.GetDateTimeVietnam();
                req.HomeStay.ViewCount = 0;

                // Thêm HomeStay
                var hsCreated = await _dBContext.HomeStays.AddAsync(req.HomeStay);
                await _dBContext.SaveChangesAsync(); // Lưu để có ID

                if (hsCreated.Entity?.HomestayID == null)
                {
                    await transaction.RollbackAsync();
                    return false;
                }

                var homestayId = hsCreated.Entity.HomestayID;

                // Chuẩn bị DetailHomeStay
                req.DetailHomeStay!.HomestayID = homestayId;
                req.DetailHomeStay.ID = null;
                await _dBContext.DetailHomeStays.AddAsync(req.DetailHomeStay);

                // Chuẩn bị danh sách Amenities (bulk insert)
                if (req.ListAmenities?.Any() == true)
                {
                    var homeStayAmenities = req.ListAmenities.Select(idAmen => new HomeStayAmenities
                    {
                        id = GenerateRandomId()+idAmen+homestayId,
                        HomestayID = homestayId,
                        AmenityID = idAmen
                    }).ToList();

                    await _dBContext.HomeStayAmenities.AddRangeAsync(homeStayAmenities);
                }

                // Chuẩn bị danh sách Rooms (bulk insert)
                if (req.Rooms?.Any() == true)
                {
                    var currentTime = TimeHelper.GetDateTimeVietnam();
                    foreach (var room in req.Rooms)
                    {
                        room.RoomId = null; // Đảm bảo ID là null để tự động tạo mới
                        room.HomestayId = homestayId ?? 0;
                        room.CreatedAt = currentTime;
                        room.UpdatedAt = currentTime;
                    }
                    await _dBContext.Rooms.AddRangeAsync(req.Rooms);
                }

                // Lưu tất cả thay đổi một lần
                var result = await _dBContext.SaveChangesAsync();

                if (result > 0)
                {
                    await transaction.CommitAsync();
                    return true;
                }
                else
                {
                    await transaction.RollbackAsync();
                    return false;
                }
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                

                throw; // Re-throw để caller có thể handle
            }
        }
        private int GenerateRandomId()
        {
            DateTime now = DateTime.Now;
            // Lấy mili giây từ thời gian hiện tại và chuyển đổi nó thành số nguyên
            return (int)(now.Ticks % int.MaxValue); // Sử dụng modulo để đảm bảo trong giới hạn int
        }

        public async Task<bool> updateHomeStay(HomeStayReqDTO req)
        {
            using var transaction = await _dBContext.Database.BeginTransactionAsync();
            try
            {
                // Tìm đối tượng HomeStay trong cơ sở dữ liệu
                var existingHomeStay = await _dBContext.HomeStays.FindAsync(req.HomeStay!.HomestayID);
                if (existingHomeStay == null)
                {
                    await transaction.RollbackAsync();
                    return false;
                }

                // Cập nhật HomeStay
                req.HomeStay.StatusHomestay = 0;
                _dBContext.Entry(existingHomeStay).CurrentValues.SetValues(req.HomeStay);

                // Cập nhật chi tiết HomeStay
                if (req.DetailHomeStay != null)
                {
                    var existingDetail = await _dBContext.DetailHomeStays
                        .FirstOrDefaultAsync(d => d.HomestayID == req.HomeStay.HomestayID);

                    if (existingDetail != null)
                    {
                        req.DetailHomeStay.ID = existingDetail.ID;
                        req.DetailHomeStay.HomestayID = existingDetail.HomestayID;
                        _dBContext.Entry(existingDetail).CurrentValues.SetValues(req.DetailHomeStay);
                    }
                }

                // Cập nhật các tiện nghi của HomeStay
                if (req.ListAmenities != null && req.ListAmenities.Any())
                {
                    // Xóa tất cả tiện nghi cũ
                    var existingAmenities = await _dBContext.HomeStayAmenities
                        .Where(hsa => hsa.HomestayID == req.HomeStay.HomestayID)
                        .ToListAsync();

                    _dBContext.HomeStayAmenities.RemoveRange(existingAmenities);

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
                var result = await _dBContext.SaveChangesAsync();

                if (result > 0)
                {
                    await transaction.CommitAsync();
                    return true;
                }
                else
                {
                    await transaction.RollbackAsync();
                    return false;
                }
            }
            catch
            {
                await transaction.RollbackAsync();
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
                homestay.IsLocked = true;
                _dBContext.HomeStays.Update(homestay);
                return await _dBContext.SaveChangesAsync() > 0;
            }
            return false;

        }
        public async Task<IEnumerable<Service>> GetAllServices(string idOwner)
        {
            return await _dBContext.Services.Where(s=>s.OwnerID==idOwner).OrderByDescending(s=>s.CreatedAt).ToListAsync();
        }

        public async Task<Service?> GetServiceById(int id)
        {
            return await _dBContext.Services.FindAsync(id);
        }

        public async Task<bool> AddService(Service service)
        {
            service.ServiceID = null; // Đảm bảo ID là null để tự động tạo mới
            service.CreatedAt = TimeHelper.GetDateTimeVietnam();
            service.UpdatedAt = TimeHelper.GetDateTimeVietnam();
            await _dBContext.Services.AddAsync(service);
            return await _dBContext.SaveChangesAsync() > 0;
        }

        public async Task<bool> UpdateService(Service service)
        {
            
            service.UpdatedAt = TimeHelper.GetDateTimeVietnam(); // Cập nhật UpdatedAt

            _dBContext.Services.Update(service);
            return await _dBContext.SaveChangesAsync() > 0;
        }

        public async Task<bool> DeleteService(int id)
        {
            var service = await _dBContext.Services.FindAsync(id);
            if (service != null)
            {
                _dBContext.Services.Remove(service);
                return await _dBContext.SaveChangesAsync() > 0;
            }
            return false;
        }
    }
}
