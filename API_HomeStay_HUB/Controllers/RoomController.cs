using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using System.Collections.Generic;
using System.Threading.Tasks;
using API_HomeStay_HUB.Services;
using API_HomeStay_HUB.Data;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomController : ControllerBase
    {
        private readonly IRoomService _roomService;
        private readonly DBContext _dBContext;

        public RoomController(IRoomService roomService,DBContext dBContext)
        {
            _roomService = roomService;
            _dBContext = dBContext;
        }

        [HttpGet("getListTypeRoom")]
        public async Task<IActionResult> getListTypeRoom()
        {
            var roomTypes = await _dBContext.Rooms
                .Where(r => r.RoomType != null)
                .Select(s => s.RoomType)
                .Distinct()
                .ToListAsync();

            return Ok(roomTypes);
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Room>>> GetAllRooms()
        {
            var rooms = await _roomService.GetAllRooms();
            return Ok(rooms);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Room>> GetRoomById(int id)
        {
            var room = await _roomService.GetRoomById(id);
            if (room == null)
            {
                return NotFound();
            }
            return Ok(room);
        }

        [HttpGet("homestay/{homestayId}")]
        public async Task<ActionResult<IEnumerable<Room>>> GetRoomsByHomestayId(int homestayId)
        {
            var rooms = await _roomService.GetRoomsByHomestayId(homestayId);
            return Ok(rooms);
        }

        [HttpPost]
        public async Task<ActionResult> AddRoom(Room room)
        {
            room.RoomId = null; // Ensure RoomId is null for new room creation
            var result = await _roomService.AddRoom(room);
            if (result)
            {
                return Ok("success add");
            }
            return BadRequest();
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> UpdateRoom(int id, Room room)
        {
            if (id != room.RoomId)
            {
                return BadRequest();
            }

            var result = await _roomService.UpdateRoom(room);
            if (!result)
            {
                return NotFound();
            }
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteRoom(int id)
        {
            var result = await _roomService.DeleteRoom(id);
            if (!result)
            {
                return NotFound();
            }
            return Ok("success");
        }
    }
}
