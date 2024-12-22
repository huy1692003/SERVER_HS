using Microsoft.AspNetCore.SignalR;

namespace API_HomeStay_HUB.Realtime
{
    public class ChatHub:Hub
    {
        public async Task SendMessage(int conversationId,int typeUser, string idUser, string message)
        {
            await Clients.Group(conversationId.ToString()).SendAsync("ReceiveMessage",typeUser, idUser, message);
        }

        // Tham gia vào một cuộc trò chuyện
        public async Task JoinConversation(int conversationId)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, conversationId.ToString());
        }

        // Rời khỏi cuộc trò chuyện
        public async Task LeaveConversation(int conversationId)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, conversationId.ToString());
        }
    }
}
