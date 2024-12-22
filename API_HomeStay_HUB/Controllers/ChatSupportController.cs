using API_HomeStay_HUB.Data;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Realtime;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;

namespace API_HomeStay_HUB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ChatSupportController : ControllerBase
    {
        private readonly DBContext dbContext;
        private readonly IHubContext<ChatHub> hub;
        public ChatSupportController(DBContext dBContext, IHubContext<ChatHub> hub)
        {
            this.dbContext = dBContext;
            this.hub = hub;
        }

        [HttpPost("openTabChat")]
        public async Task<IActionResult> createConversation(Conversation conversation)
        {
            var exitedConversation = dbContext.Conversations.FirstOrDefault(s => s.User1 == conversation.User1 && s.User2 == conversation.User2);
            if (exitedConversation != null)
            {

                return Ok(exitedConversation);
            }
            else
            {
                var model = dbContext.Conversations.Add(conversation);
                model.Entity.Messages = [];
                dbContext.SaveChanges();
                return Ok(model.Entity);

            }
        }

        [HttpGet("getMessageByConverID/{id}")]
        public async Task<IActionResult> getMessage(int id)
        {
            return Ok(await dbContext.Messages.Where(s => s.ConversationID == id).OrderBy(s=>s.Timestamp).ToListAsync());

        } 
        
        [HttpGet("getListConversation/{idUser}/{typeUser}")]
        public async Task<IActionResult> getMessage(string idUser,int typeUser)
        {
           if(typeUser==1)
            {
                var list = await dbContext.Conversations.Where(s => s.User1 == idUser)
               .Select(s => new
               {
                   s,
                   lastMessage = dbContext.Messages.Where(m => m.ConversationID == s.ConversationID).OrderByDescending(s => s.Timestamp).FirstOrDefault(),
               })
               .ToListAsync();

                return Ok(list);
            }
            else
            {
                var list = await dbContext.Conversations.Where(s => s.User2 == idUser)
             .Select(s => new
             {
                 s,
                 lastMessage = dbContext.Messages.Where(m => m.ConversationID == s.ConversationID).OrderByDescending(s => s.Timestamp).FirstOrDefault(),
             })
             .ToListAsync();

                return Ok(list);
            }

        }


        [HttpPost("createMessage/{userReseiver}")]
        public async Task<IActionResult> createMessage(string userReseiver, [FromBody] Message mes)
        {
            var model = await dbContext.Messages.AddAsync(mes);
            var check = await dbContext.SaveChangesAsync() > 0;

            if (check)
            {

                await hub.Clients.All.SendAsync("ReceiverMessage",model.Entity, model.Entity.ConversationID, userReseiver);
            }
            return check ? Ok("success") : BadRequest();
        }

    }
}
