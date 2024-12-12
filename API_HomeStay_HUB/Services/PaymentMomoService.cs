using System.Security.Cryptography;
using System.Text;
using API_HomeStay_HUB.Model;
using API_HomeStay_HUB.Model.Momo;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using RestSharp;

namespace API_HomeStay_HUB.Services
{
    public class PaymentMomoService
    {
        private readonly MomoOptionModel _momoOptions;

        // Inject IOptions<MomoOptionModel> để lấy cấu hình từ appsettings.json
        public PaymentMomoService(IOptions<MomoOptionModel> options)
        {
            _momoOptions = options.Value; // Lấy giá trị từ cấu hình
        }

        public async Task<MomoCreateResponse> CreatePaymentAsync(BookingInfor model)
        {
            
          
            try
            {
                model.OrderInfor= model.OrderInfor;
                model.descrtiption = "Khách hàng " + model.FullName + " ----- : " + model.descrtiption;

                var rawData =
               $"partnerCode={_momoOptions.PartnerCode}" +
               $"&accessKey={_momoOptions.AccessKey}" +
               $"&requestId={model.OrderInfor}" +
               $"&amount={model.amount}" +
               $"&orderId={model.OrderInfor}" +
               $"&orderInfo={model.descrtiption}" +
               $"&returnUrl={_momoOptions.ReturnUrl}" +
               $"&notifyUrl={_momoOptions.NotifyUrl}" +
               $"&extraData=";

                var signature = ComputeHmacSha256(rawData, _momoOptions.SecretKey);

                var client = new RestClient(_momoOptions.MomoApiUrl);
                var request = new RestRequest() { Method = Method.Post };
                request.AddHeader("Content-Type", "application/json; charset=UTF-8");

                // Tạo đối tượng đại diện cho dữ liệu yêu cầu
                var requestData = new
                {
                    accessKey = _momoOptions.AccessKey,
                    partnerCode = _momoOptions.PartnerCode,
                    requestType = _momoOptions.RequestType,
                    notifyUrl = _momoOptions.NotifyUrl,
                    returnUrl = _momoOptions.ReturnUrl,
                    orderId = model.OrderInfor,
                    amount = model.amount.ToString(),
                    orderInfo = model.descrtiption,
                    requestId = model.OrderInfor,
                    extraData = "",
                    signature = signature
                };

                request.AddParameter("application/json", JsonConvert.SerializeObject(requestData), ParameterType.RequestBody);

                var response = await client.ExecuteAsync(request);
                var momoResponse = JsonConvert.DeserializeObject<MomoCreateResponse>(response.Content);
                return momoResponse;
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi khi tạo thanh toán Momo", ex);
            }
        }

        public string ComputeHmacSha256(string rawData, string secretKey)
        {
            var keyBytes = Encoding.UTF8.GetBytes(secretKey);
            var dataBytes = Encoding.UTF8.GetBytes(rawData);

            using (var hmac = new HMACSHA256(keyBytes))
            {
                var hashBytes = hmac.ComputeHash(dataBytes);
                return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
            }
        }

        public MomoExecuteResponseModel PaymentExecuteAsync(IQueryCollection collection)
        {
            var amount = collection.First(s => s.Key == "amount").Value;
            var orderInfo = collection.First(s => s.Key == "orderInfo").Value;
            var orderId = collection.First(s => s.Key == "orderId").Value;

            return new MomoExecuteResponseModel()
            {
                Amount = amount,
                OrderId = orderId,
                OrderInfo = orderInfo
            };
        }
    }
}
