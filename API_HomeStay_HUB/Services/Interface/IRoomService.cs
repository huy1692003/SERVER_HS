using API_HomeStay_HUB.Model;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_HomeStay_HUB.Services.Interface
{
    public interface IRoomService
    {
        Task<IEnumerable<Room>> GetAllRooms();
        Task<Room> GetRoomById(int roomId);
        Task<IEnumerable<Room>> GetRoomsByHomestayId(int homestayId);
        Task<bool> AddRoom(Room room);
        Task<bool> UpdateRoom(Room room);
        Task<bool> DeleteRoom(int roomId);
    }
}
