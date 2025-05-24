using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_HomeStay_HUB.Repositories
{
    public class RoomRepository : IRoomRepository
    {
        private readonly DBContext _context;

        public RoomRepository(DBContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Room>> GetAllRooms()
        {
            return await _context.Rooms
                .ToListAsync();
        }

        public async Task<Room> GetRoomById(int roomId)
        {
            var res = await _context.Rooms
                .FirstOrDefaultAsync(r => r.RoomId == roomId);
            return res;
        }

        public async Task<IEnumerable<Room>> GetRoomsByHomestayId(int homestayId)
        {
            return await _context.Rooms
                .Where(r => r.HomestayId == homestayId)
                .ToListAsync();
        }

        public async Task<bool> AddRoom(Room room)
        {
            room.CreatedAt = DateTime.Now;
            room.UpdatedAt = DateTime.Now;
            await _context.Rooms.AddAsync(room);
            return await _context.SaveChangesAsync() > 0;
        }

        public async Task<bool> UpdateRoom(Room room)
        {
            var existingRoom = await _context.Rooms.FindAsync(room.RoomId);
            if (existingRoom == null)
                return false;
            room.CreatedAt = existingRoom.CreatedAt; // Preserve the original CreatedAt value
            room.UpdatedAt = DateTime.Now;
            _context.Entry(existingRoom).CurrentValues.SetValues(room);
            return await _context.SaveChangesAsync() > 0;
        }

        public async Task<bool> DeleteRoom(int roomId)
        {
            var room = await _context.Rooms.FindAsync(roomId);
            if (room == null)
                return false;

            _context.Rooms.Remove(room);
            return await _context.SaveChangesAsync() > 0;
        }
    }
}
