namespace API_HomeStay_HUB.Services.Interface
{
    public interface ISendMaillService
    {
        Task<bool> SendMaill(string toMaill ,string title, string content);
    }
}
