using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Services.Interface;
using System.Collections.Generic;
using System.Threading.Tasks;
using API_HomeStay_HUB.Services;
using API_HomeStay_HUB.Data;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using API_HomeStay_HUB.DTOs;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomController : ControllerBase
    {
        private readonly IRoomService _roomService;
        private readonly DBContext _dBContext;

        public RoomController(IRoomService roomService, DBContext dBContext)
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

        [HttpPut("addHiddenDates/{idRoom}")]
        public async Task<IActionResult> AddHiddenDates(int idRoom, [FromBody] List<DateTime> hiddenDates)
        {
            var room = await _dBContext.Rooms.FindAsync(idRoom);
            if (room == null)
            {
                return NotFound();
            }
            else if (hiddenDates == null || hiddenDates.Count == 0)
            {
                return BadRequest("No dates provided to hide.");
            }
            else
            {
                room.RoomHiddenDates=JsonConvert.DeserializeObject<List<YearDateHideForRoomDTO>>(room.DateHide) ?? new List<YearDateHideForRoomDTO>();
                AddDateFromHidden(room, hiddenDates).Wait();
                _dBContext.SaveChanges();
            }
            return Ok("Hidden dates added successfully.");
        }

        private Task AddDateFromHidden(Room room, List<DateTime> dates)
        {
            foreach (var date in dates)
            {
                var yearData = room.RoomHiddenDates.FirstOrDefault(y => y.year == date.Year);
                if (yearData == null)
                {
                    yearData = new YearDateHideForRoomDTO { year = date.Year, months = new List<MonthsDTO>() };
                    room.RoomHiddenDates.Add(yearData);
                }

                var monthData = yearData.months.FirstOrDefault(m => m.month == date.Month);
                if (monthData == null)
                {
                    monthData = new MonthsDTO { month = date.Month, hiddenDays = new List<int>() };
                    yearData.months.Add(monthData);
                }

                if (!monthData.hiddenDays.Contains(date.Day))
                    monthData.hiddenDays.Add(date.Day);
            }
            room.DateHide = JsonConvert.SerializeObject(room.RoomHiddenDates);
            // Lưu thay đổi vào database nếu cần
            _dBContext.Update(room);
            return Task.CompletedTask;
        }
    }

}
