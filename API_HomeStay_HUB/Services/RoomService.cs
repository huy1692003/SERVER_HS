using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Interfaces;
using API_HomeStay_HUB.Services.Interface;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_HomeStay_HUB.Services
{
    public class RoomService : IRoomService
    {
        private readonly IRoomRepository _roomRepository;

        public RoomService(IRoomRepository roomRepository)
        {
            _roomRepository = roomRepository;
        }

        public async Task<IEnumerable<Room>> GetAllRooms()
        {
            return await _roomRepository.GetAllRooms();
        }

        public async Task<Room> GetRoomById(int roomId)
        {
            return await _roomRepository.GetRoomById(roomId);
        }

        public async Task<IEnumerable<Room>> GetRoomsByHomestayId(int homestayId)
        {
            return await _roomRepository.GetRoomsByHomestayId(homestayId);
        }

        public async Task<bool> AddRoom(Room room)
        {
            return await _roomRepository.AddRoom(room);
        }

        public async Task<bool> UpdateRoom(Room room)
        {
            return await _roomRepository.UpdateRoom(room);
        }

        public async Task<bool> DeleteRoom(int roomId)
        {
            return await _roomRepository.DeleteRoom(roomId);
        }
    }
}
