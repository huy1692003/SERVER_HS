using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Repositories.Intefaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OwnerController : ControllerBase
    {
        private readonly DBContext dbContext;
        private readonly IUserRepository _userRepository;
        
        public OwnerController(DBContext db, IUserRepository userRepository)
        {
            dbContext = db;
            _userRepository = userRepository;
        }
        
        [HttpGet("getProfileOwnerStay")]
        public async Task<IActionResult> GetOwnerStayByID(string idOwner)
        {
            var owners = await (from owner in dbContext.OwnerStays
                                join user in dbContext.Users
                                on owner.UserID equals user.UserID
                                where owner.OwnerID == idOwner
                                select new
                                {
                                    user,owner

                                }).FirstOrDefaultAsync();
            owners.user.Password = null;
            return Ok(owners);
        }
        
       
        [HttpPut("updateProfile")]
        public async Task<IActionResult> UpdateProfile([FromBody] OwnerStay ownerStay)
        {
            try
            {
                // Update user information
                bool userUpdated = await _userRepository.updateProfile(ownerStay.User);
                
                // Update owner information if provided
                bool ownerUpdated = false;
                if (ownerStay != null && !string.IsNullOrEmpty(ownerStay.OwnerID))
                {
                    var existingOwner = await dbContext.OwnerStays.FindAsync(ownerStay.OwnerID);
                    if (existingOwner != null)
                    {
                        existingOwner.BannerImage = ownerStay.BannerImage ?? existingOwner.BannerImage;
                        existingOwner.DefaultCheckinTime = ownerStay.DefaultCheckinTime ?? existingOwner.DefaultCheckinTime;
                        existingOwner.DefaultCheckoutTime = ownerStay.DefaultCheckoutTime ?? existingOwner.DefaultCheckoutTime;
                        existingOwner.NameBank = ownerStay.NameBank ?? existingOwner.NameBank;
                        existingOwner.NumberBank = ownerStay.NumberBank ?? existingOwner.NumberBank;
                        existingOwner.DefaultRules = ownerStay.DefaultRules ?? existingOwner.DefaultRules;
                        existingOwner.DefaultPolicies = ownerStay.DefaultPolicies ?? existingOwner.DefaultPolicies;
                        existingOwner.Description = ownerStay.Description ?? existingOwner.Description;
                        
                        ownerUpdated = await dbContext.SaveChangesAsync() > 0;
                    }
                }
                
                if (userUpdated || ownerUpdated)
                {
                    return Ok(new { success = true, message = "Profile updated successfully" });
                }
                return BadRequest(new { success = false, message = "Failed to update profile" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = ex.Message });
            }
        }
        
        [HttpPut("changePassword")]
        public async Task<IActionResult> ChangePassword(string userId, string oldPassword, string newPassword)
        {
            try
            {
                bool result = await _userRepository.changePassWord(userId, oldPassword, newPassword);
                if (result)
                {
                    return Ok(new { success = true, message = "Password changed successfully" });
                }
                return BadRequest(new { success = false, message = "Invalid old password or user not found" });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { success = false, message = ex.Message });
            }
        }
    }
}
