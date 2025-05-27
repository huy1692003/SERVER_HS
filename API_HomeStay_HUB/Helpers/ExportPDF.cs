using API_HomeStay_HUB.Model;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using System;
using System.IO;
using System.Collections.Generic;
using System.Globalization;
using iTextSharp.text.pdf.draw;
using API_HomeStay_HUB.DTOs;
using System.Threading.Tasks;

namespace API_HomeStay_HUB.Helpers
{
    public class ExportPDF
    {
        private readonly string _filePath;
        private readonly string _fontPath;

        public ExportPDF(IConfiguration configuration)
        {
            _filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/files");
            _fontPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/fonts");

            // Tạo thư mục nếu chưa tồn tại
            if (!Directory.Exists(_filePath))
            {
                Directory.CreateDirectory(_filePath);
            }

            if (!Directory.Exists(_fontPath))
            {
                Directory.CreateDirectory(_fontPath);
            }
        }

        private BaseFont GetCustomFont()
        {
            try
            {
                // Tìm kiếm các file font phổ biến trong thư mục fonts
                string[] fontFiles = {
                    "arial.ttf",
                    "Arial.ttf",
                    "times.ttf",
                    "Times.ttf",
                    "calibri.ttf",
                    "Calibri.ttf",
                    "tahoma.ttf",
                    "Tahoma.ttf",
                    "verdana.ttf",
                    "Verdana.ttf"
                };

                foreach (string fontFile in fontFiles)
                {
                    string fontFilePath = Path.Combine(_fontPath, fontFile);
                    if (File.Exists(fontFilePath))
                    {
                        return BaseFont.CreateFont(fontFilePath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
                    }
                }

                // Nếu không tìm thấy font tùy chỉnh, sử dụng font mặc định
                return BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            }
            catch (Exception)
            {
                // Fallback to default font if custom font fails
                return BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            }
        }

        private BaseFont GetVietnameseFont()
        {
            try
            {
                // Tìm kiếm font hỗ trợ tiếng Việt
                string[] vietnameseFontFiles = {
                    "NotoSans-Regular.ttf",
                    "Roboto-Regular.ttf",
                    "OpenSans-Regular.ttf",
                    "arial-unicode-ms.ttf",
                    "ArialUnicodeMS.ttf",
                    "arial.ttf",
                    "Arial.ttf"
                };

                foreach (string fontFile in vietnameseFontFiles)
                {
                    string fontFilePath = Path.Combine(_fontPath, fontFile);
                    if (File.Exists(fontFilePath))
                    {
                        return BaseFont.CreateFont(fontFilePath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
                    }
                }

                // Fallback: thử sử dụng font system
                string systemFontPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Fonts), "arial.ttf");
                if (File.Exists(systemFontPath))
                {
                    return BaseFont.CreateFont(systemFontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
                }

                // Cuối cùng sử dụng font mặc định
                return BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            }
            catch (Exception)
            {
                return BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            }
        }

        public async Task<string> getDetaiBill(Booking booking, HomeStayDetailDTO? hs)
        {
            // Tạo tên file unique
            string fileName = $"bill_{booking.BookingID}_{DateTime.Now:yyyyMMdd_HHmmss}.pdf";
            string fullPath = Path.Combine(_filePath, fileName);

            try
            {
                using (FileStream fs = new FileStream(fullPath, FileMode.Create))
                {
                    Document document = new Document(PageSize.A4, 25, 25, 30, 30);
                    PdfWriter writer = PdfWriter.GetInstance(document, fs);
                    document.Open();

                    // Sử dụng font tùy chỉnh
                    BaseFont baseFont = GetVietnameseFont(); // Sử dụng font hỗ trợ tiếng Việt
                    Font titleFont = new Font(baseFont, 18, Font.BOLD, BaseColor.DARK_GRAY);
                    Font headerFont = new Font(baseFont, 14, Font.BOLD, BaseColor.DARK_GRAY);
                    Font subHeaderFont = new Font(baseFont, 12, Font.BOLD, BaseColor.DARK_GRAY);
                    Font normalFont = new Font(baseFont, 10, Font.NORMAL);
                    Font boldFont = new Font(baseFont, 10, Font.BOLD);
                    Font italicFont = new Font(baseFont, 9, Font.ITALIC);
                    Font highlightFont = new Font(baseFont, 10, Font.BOLD, new BaseColor(255, 102, 0));

                    // Header
                    PdfPTable headerTable = new PdfPTable(2);
                    headerTable.WidthPercentage = 100;
                    headerTable.SetWidths(new float[] { 2f, 1f });

                    // Logo and Company Info
                    PdfPCell logoCell = new PdfPCell();
                    Paragraph companyInfo = new Paragraph();
                    companyInfo.Add(new Chunk("HOMESTAY HUB\n", titleFont));
                    companyInfo.Add(new Chunk("Địa chỉ: 123 Đường ABC, Quận XYZ\n", normalFont));
                    companyInfo.Add(new Chunk("Email: contact@homestayhub.com\n", normalFont));
                    companyInfo.Add(new Chunk("Hotline: 1900 1234", normalFont));
                    logoCell.AddElement(companyInfo);
                    logoCell.Border = Rectangle.NO_BORDER;
                    headerTable.AddCell(logoCell);

                    // Invoice Info
                    PdfPCell invoiceInfoCell = new PdfPCell();
                    Paragraph invoiceInfo = new Paragraph();
                    invoiceInfo.Alignment = Element.ALIGN_RIGHT;
                    invoiceInfo.Add(new Chunk("HÓA ĐƠN ĐẶT PHÒNG\n", headerFont));
                    invoiceInfo.Add(new Chunk($"Mã đơn: #{booking.BookingID}\n", boldFont));
                    invoiceInfo.Add(new Chunk($"Ngày tạo: {DateTime.Now.ToString("dd/MM/yyyy HH:mm")}\n", normalFont));
                    invoiceInfo.Add(new Chunk($"Trạng thái: {(booking.IsConfirm ? "Đã xác nhận" : "Chờ xác nhận")}", normalFont));
                    invoiceInfoCell.AddElement(invoiceInfo);
                    invoiceInfoCell.Border = Rectangle.NO_BORDER;
                    headerTable.AddCell(invoiceInfoCell);
                    document.Add(headerTable);

                    // Separator
                    LineSeparator line = new LineSeparator(1f, 100f, new BaseColor(220, 220, 220), Element.ALIGN_CENTER, -1);
                    document.Add(new Chunk(line));
                    document.Add(Chunk.NEWLINE);

                    // Customer Info
                    Paragraph customerTitle = new Paragraph("THÔNG TIN KHÁCH HÀNG", subHeaderFont);
                    document.Add(customerTitle);
                    document.Add(Chunk.NEWLINE);

                    PdfPTable customerTable = new PdfPTable(2);
                    customerTable.WidthPercentage = 100;
                    customerTable.SetWidths(new float[] { 1f, 1f });

                    AddCustomerInfoRow(customerTable, "Tên khách hàng:", booking.Name, normalFont, boldFont);
                    AddCustomerInfoRow(customerTable, "Số điện thoại:", booking.Phone, normalFont, boldFont);
                    AddCustomerInfoRow(customerTable, "Email:", booking.Email, normalFont, boldFont);
                    AddCustomerInfoRow(customerTable, "Ngày nhận phòng:", booking.CheckInDate.ToString("dd/MM/yyyy"), normalFont, boldFont);
                    AddCustomerInfoRow(customerTable, "Ngày trả phòng:", booking.CheckOutDate.ToString("dd/MM/yyyy"), normalFont, boldFont);
                    AddCustomerInfoRow(customerTable, "Số người lớn:", booking.NumberAdults.ToString(), normalFont, boldFont);
                    AddCustomerInfoRow(customerTable, "Số trẻ em:", booking.NumberChildren.ToString(), normalFont, boldFont);
                    AddCustomerInfoRow(customerTable, "Số em bé:", booking.NumberBaby.ToString(), normalFont, boldFont);

                    document.Add(customerTable);
                    document.Add(Chunk.NEWLINE);

                    // Booking Details
                    Paragraph bookingTitle = new Paragraph("CHI TIẾT ĐẶT PHÒNG", subHeaderFont);
                    document.Add(bookingTitle);
                    document.Add(Chunk.NEWLINE);
                    // HomeStay Info
                    PdfPTable homeStayTable = new PdfPTable(2);
                    homeStayTable.WidthPercentage = 100;
                    homeStayTable.SetWidths(new float[] { 1f, 1f });

                    PdfPCell homeStayHeaderCell = new PdfPCell(new Phrase("Thông tin HomeStay", boldFont));
                    homeStayHeaderCell.BackgroundColor = new BaseColor(240, 240, 240);
                    homeStayHeaderCell.Padding = 8f;
                    homeStayHeaderCell.Colspan = 2;
                    homeStayTable.AddCell(homeStayHeaderCell);

                    AddCustomerInfoRow(homeStayTable, "Tên HomeStay:", hs.HomeStay.HomestayName, normalFont, boldFont);
                    AddCustomerInfoRow(homeStayTable, "Tên chủ nhà:", hs.UserNameOwner, normalFont, boldFont);
                    AddCustomerInfoRow(homeStayTable, "Địa chỉ:", hs.HomeStay.AddressDetail, normalFont, boldFont);
                    AddCustomerInfoRow(homeStayTable, "Giờ nhận phòng:", hs.HomeStay.TimeCheckIn ?? "14:00", normalFont, boldFont);
                    AddCustomerInfoRow(homeStayTable, "Giờ trả phòng:", hs.HomeStay.TimeCheckOut ?? "12:00", normalFont, boldFont);

                    document.Add(homeStayTable);
                    document.Add(Chunk.NEWLINE);

                    // Room Info
                    PdfPTable roomTable = new PdfPTable(4);
                    roomTable.WidthPercentage = 100;
                    roomTable.SetWidths(new float[] { 1f, 1f, 1f, 1f });

                    PdfPCell roomHeaderCell = new PdfPCell(new Phrase("Thông tin phòng", boldFont));
                    roomHeaderCell.BackgroundColor = new BaseColor(240, 240, 240);
                    roomHeaderCell.Padding = 8f;
                    roomHeaderCell.Colspan = 4;
                    roomTable.AddCell(roomHeaderCell);

                    AddTableHeader(roomTable, new string[] { "Mã phòng", "Tên phòng", "Số đêm", "Thành tiền" }, boldFont);

                    int nights = (booking.CheckOutDate - booking.CheckInDate).Days;

                    var room = hs.Rooms.FirstOrDefault(s => s.RoomId == booking.RoomID);
                    // Lấy thông tin chi tiết về phòng từ booking
                    string roomName = room.RoomName ?? "Phòng tiêu chuẩn";

                    AddTableRow(roomTable, new string[] {
                        booking.RoomID.ToString(),
                        roomName,
                        nights.ToString(),
                        FormatCurrency(booking.OriginalPrice ?? 0)
                    }, normalFont);

                    document.Add(roomTable);
                    document.Add(Chunk.NEWLINE);

                    // Parse Extra Costs if available
                    if (!string.IsNullOrEmpty(booking.DetailExtraCost))
                    {
                        var extraCosts = JsonConvert.DeserializeObject<dynamic>(booking.DetailExtraCost);

                        // Extra Person Costs
                        if (extraCosts.extraPersonCost != null)
                        {
                            PdfPTable extraPersonTable = new PdfPTable(4);
                            extraPersonTable.WidthPercentage = 100;
                            extraPersonTable.SetWidths(new float[] { 2f, 1f, 1f, 1f });

                            PdfPCell extraPersonHeaderCell = new PdfPCell(new Phrase("Phụ thu người ở thêm", boldFont));
                            extraPersonHeaderCell.BackgroundColor = new BaseColor(240, 240, 240);
                            extraPersonHeaderCell.Padding = 8f;
                            extraPersonHeaderCell.Colspan = 4;
                            extraPersonTable.AddCell(extraPersonHeaderCell);

                            AddTableHeader(extraPersonTable, new string[] { "Loại", "Số lượng", "Đơn giá", "Thành tiền" }, boldFont);

                            if (extraCosts.extraPersonCost.extraAdult != null && extraCosts.extraPersonCost.extraAdult.count > 0)
                            {
                                AddTableRow(extraPersonTable, new string[] {
                                    "Người lớn thêm",
                                    extraCosts.extraPersonCost.extraAdult.count.ToString(),
                                    FormatCurrency((double)extraCosts.extraPersonCost.extraAdult.fee),
                                    FormatCurrency((double)extraCosts.extraPersonCost.extraAdult.total)
                                }, normalFont);
                            }

                            if (extraCosts.extraPersonCost.extraChild != null && extraCosts.extraPersonCost.extraChild.count > 0)
                            {
                                AddTableRow(extraPersonTable, new string[] {
                                    "Trẻ em thêm",
                                    extraCosts.extraPersonCost.extraChild.count.ToString(),
                                    FormatCurrency((double)extraCosts.extraPersonCost.extraChild.fee),
                                    FormatCurrency((double)extraCosts.extraPersonCost.extraChild.total)
                                }, normalFont);
                            }

                            if (extraCosts.extraPersonCost.extraBaby != null && extraCosts.extraPersonCost.extraBaby.count > 0)
                            {
                                AddTableRow(extraPersonTable, new string[] {
                                    "Em bé thêm",
                                    extraCosts.extraPersonCost.extraBaby.count.ToString(),
                                    FormatCurrency((double)extraCosts.extraPersonCost.extraBaby.fee),
                                    FormatCurrency((double)extraCosts.extraPersonCost.extraBaby.total)
                                }, normalFont);
                            }

                            document.Add(extraPersonTable);
                            document.Add(Chunk.NEWLINE);
                        }

                        // Service Costs
                        if (extraCosts.serviceCost != null && extraCosts.serviceCost.Count > 0)
                        {
                            PdfPTable serviceTable = new PdfPTable(4);
                            serviceTable.WidthPercentage = 100;
                            serviceTable.SetWidths(new float[] { 2f, 1f, 1f, 1f });

                            PdfPCell serviceHeaderCell = new PdfPCell(new Phrase("Dịch vụ sử dụng", boldFont));
                            serviceHeaderCell.BackgroundColor = new BaseColor(240, 240, 240);
                            serviceHeaderCell.Padding = 8f;
                            serviceHeaderCell.Colspan = 4;
                            serviceTable.AddCell(serviceHeaderCell);

                            AddTableHeader(serviceTable, new string[] { "Tên dịch vụ", "Số lượng", "Đơn giá", "Thành tiền" }, boldFont);

                            foreach (var service in extraCosts.serviceCost)
                            {
                                AddTableRow(serviceTable, new string[] {
                                    service.serviceName.ToString(),
                                    service.quantity.ToString(),
                                    FormatCurrency((double)service.price),
                                    FormatCurrency((double)service.total)
                                }, normalFont);
                            }

                            document.Add(serviceTable);
                            document.Add(Chunk.NEWLINE);
                        }

                        // Other Costs
                        if (extraCosts.otherCost != null && extraCosts.otherCost.Count > 0)
                        {
                            PdfPTable otherTable = new PdfPTable(2);
                            otherTable.WidthPercentage = 100;
                            otherTable.SetWidths(new float[] { 3f, 1f });

                            PdfPCell otherHeaderCell = new PdfPCell(new Phrase("Chi phí khác", boldFont));
                            otherHeaderCell.BackgroundColor = new BaseColor(240, 240, 240);
                            otherHeaderCell.Padding = 8f;
                            otherHeaderCell.Colspan = 2;
                            otherTable.AddCell(otherHeaderCell);

                            AddTableHeader(otherTable, new string[] { "Mô tả", "Thành tiền" }, boldFont);

                            foreach (var other in extraCosts.otherCost)
                            {
                                AddTableRow(otherTable, new string[] {
                                    other.name.ToString(),
                                    FormatCurrency((double)other.amount)
                                }, normalFont);
                            }

                            document.Add(otherTable);
                            document.Add(Chunk.NEWLINE);
                        }
                    }

                    // Summary
                    PdfPTable summaryTable = new PdfPTable(2);
                    summaryTable.WidthPercentage = 100;
                    summaryTable.SetWidths(new float[] { 3f, 1f });

                    // Original Price
                    PdfPCell originalPriceCell1 = new PdfPCell(new Phrase("Tổng tiền phòng:", boldFont));
                    originalPriceCell1.Border = Rectangle.NO_BORDER;
                    originalPriceCell1.HorizontalAlignment = Element.ALIGN_RIGHT;
                    summaryTable.AddCell(originalPriceCell1);

                    PdfPCell originalPriceCell2 = new PdfPCell(new Phrase(FormatCurrency(booking.OriginalPrice ?? 0), boldFont));
                    originalPriceCell2.Border = Rectangle.NO_BORDER;
                    originalPriceCell2.HorizontalAlignment = Element.ALIGN_RIGHT;
                    summaryTable.AddCell(originalPriceCell2);

                    // Discount
                    if (booking.DiscountPrice > 0)
                    {
                        PdfPCell discountCell1 = new PdfPCell(new Phrase("Giảm giá tiền phòng:", boldFont));
                        discountCell1.Border = Rectangle.NO_BORDER;
                        discountCell1.HorizontalAlignment = Element.ALIGN_RIGHT;
                        summaryTable.AddCell(discountCell1);

                        PdfPCell discountCell2 = new PdfPCell(new Phrase("-" + FormatCurrency(booking.DiscountPrice ?? 0), boldFont));
                        discountCell2.Border = Rectangle.NO_BORDER;
                        discountCell2.HorizontalAlignment = Element.ALIGN_RIGHT;
                        summaryTable.AddCell(discountCell2);
                    }

                    // Extra Costs
                    double extraCostTotal = 0;
                    if (!string.IsNullOrEmpty(booking.DetailExtraCost))
                    {
                        var extraCosts = JsonConvert.DeserializeObject<dynamic>(booking.DetailExtraCost);
                        if (extraCosts.totalExtraCost != null)
                        {
                            extraCostTotal = (double)extraCosts.totalExtraCost;

                            PdfPCell extraCostCell1 = new PdfPCell(new Phrase("Tổng chi phí phát sinh:", boldFont));
                            extraCostCell1.Border = Rectangle.NO_BORDER;
                            extraCostCell1.HorizontalAlignment = Element.ALIGN_RIGHT;
                            summaryTable.AddCell(extraCostCell1);

                            PdfPCell extraCostCell2 = new PdfPCell(new Phrase(FormatCurrency(extraCostTotal), boldFont));
                            extraCostCell2.Border = Rectangle.NO_BORDER;
                            extraCostCell2.HorizontalAlignment = Element.ALIGN_RIGHT;
                            summaryTable.AddCell(extraCostCell2);
                        }
                    }

                    // Total
                    PdfPCell totalCell1 = new PdfPCell(new Phrase("TỔNG THANH TOÁN CHI PHÍ CÒN LẠI:", headerFont));
                    totalCell1.Border = Rectangle.NO_BORDER;
                    totalCell1.HorizontalAlignment = Element.ALIGN_RIGHT;
                    summaryTable.AddCell(totalCell1);

                    double grandTotal = extraCostTotal;
                    PdfPCell totalCell2 = new PdfPCell(new Phrase(FormatCurrency(grandTotal), new Font(baseFont, 14, Font.BOLD, new BaseColor(255, 102, 0))));
                    totalCell2.Border = Rectangle.NO_BORDER;
                    totalCell2.HorizontalAlignment = Element.ALIGN_RIGHT;
                    summaryTable.AddCell(totalCell2);

                    document.Add(summaryTable);
                    document.Add(Chunk.NEWLINE);

                    // Payment Notes
                    PdfPTable notesTable = new PdfPTable(1);
                    notesTable.WidthPercentage = 100;

                    PdfPCell notesHeaderCell = new PdfPCell(new Phrase("Ghi chú thanh toán", boldFont));
                    notesHeaderCell.BackgroundColor = new BaseColor(240, 240, 240);
                    notesHeaderCell.Padding = 8f;
                    notesTable.AddCell(notesHeaderCell);

                    PdfPCell notesCell = new PdfPCell();
                    Paragraph notes = new Paragraph();
                    notes.Add(new Chunk("1. Tiền phòng đã được thanh toán trước: ", boldFont));
                    notes.Add(new Chunk(FormatCurrency(booking.TotalPrice ?? 0), normalFont));
                    notes.Add(Chunk.NEWLINE);
                    notes.Add(new Chunk("2. Chi phí phát sinh thanh toán khi trả phòng: ", boldFont));
                    notes.Add(new Chunk(FormatCurrency(extraCostTotal), normalFont));
                    notes.Add(Chunk.NEWLINE);
                    notes.Add(new Chunk("3. Mã giảm giá đã áp dụng: ", boldFont));
                    notes.Add(new Chunk(string.IsNullOrEmpty(booking.DiscountCode) ? "Không có" : booking.DiscountCode, normalFont));
                    notesCell.AddElement(notes);
                    notesCell.Padding = 8f;
                    notesTable.AddCell(notesCell);

                    document.Add(notesTable);
                    document.Add(Chunk.NEWLINE);

                    // Footer
                    Paragraph footer = new Paragraph();
                    footer.Alignment = Element.ALIGN_CENTER;
                    footer.Add(new Chunk("Cảm ơn quý khách đã sử dụng dịch vụ của HomeStay Hub!\n", italicFont));
                    footer.Add(new Chunk("Mọi thắc mắc xin liên hệ: 1900 1234 hoặc email: support@homestayhub.com", italicFont));
                    document.Add(footer);

                    document.Close();
                }

                // Trả về đường dẫn relative để có thể truy cập qua web
                return $"files/{fileName}";
            }
            catch (Exception ex)
            {
                throw new Exception($"Error generating PDF: {ex.Message}", ex);
            }
        }

        // Alternative method: Return file as byte array for download
        public async Task<byte[]> getDetaiBillAsBytes(Booking booking, HomeStayDetailDTO hs)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                Document document = new Document(PageSize.A4, 25, 25, 30, 30);
                PdfWriter writer = PdfWriter.GetInstance(document, ms);
                document.Open();

                // Sử dụng font tùy chỉnh
                BaseFont baseFont = GetVietnameseFont();
                // ... Copy toàn bộ logic tạo PDF tương tự như method getDetaiBill ...

                document.Close();
                return ms.ToArray();
            }
        }

        // Method to save byte array to file
        public async Task<string> SavePdfToFile(byte[] pdfBytes, string fileName = null)
        {
            if (string.IsNullOrEmpty(fileName))
            {
                fileName = $"invoice_{DateTime.Now:yyyyMMdd_HHmmss}.pdf";
            }

            string fullPath = Path.Combine(_filePath, fileName);
            await File.WriteAllBytesAsync(fullPath, pdfBytes);
            return $"files/{fileName}";
        }

        // Method to return file for direct download (for controllers)
        public async Task<(byte[] fileBytes, string fileName, string contentType)> GetPdfForDownload(Booking booking, HomeStayDetailDTO hs)
        {
            byte[] pdfBytes = await getDetaiBillAsBytes(booking, hs);
            string fileName = $"invoice_{booking.BookingID}_{DateTime.Now:yyyyMMdd_HHmmss}.pdf";
            return (pdfBytes, fileName, "application/pdf");
        }

        private void AddCustomerInfoRow(PdfPTable table, string label, string value, Font normalFont, Font boldFont)
        {
            PdfPCell labelCell = new PdfPCell(new Phrase(label, boldFont));
            labelCell.Border = Rectangle.NO_BORDER;
            table.AddCell(labelCell);

            PdfPCell valueCell = new PdfPCell(new Phrase(value, normalFont));
            valueCell.Border = Rectangle.NO_BORDER;
            table.AddCell(valueCell);
        }

        private void AddTableHeader(PdfPTable table, string[] headers, Font font)
        {
            foreach (string header in headers)
            {
                PdfPCell cell = new PdfPCell(new Phrase(header, font));
                cell.BackgroundColor = new BaseColor(245, 245, 245);
                cell.HorizontalAlignment = Element.ALIGN_CENTER;
                cell.VerticalAlignment = Element.ALIGN_MIDDLE;
                cell.Padding = 5;
                table.AddCell(cell);
            }
        }

        private void AddTableRow(PdfPTable table, string[] cells, Font font)
        {
            foreach (string cell in cells)
            {
                PdfPCell pdfCell = new PdfPCell(new Phrase(cell, font));
                pdfCell.HorizontalAlignment = Element.ALIGN_CENTER;
                pdfCell.VerticalAlignment = Element.ALIGN_MIDDLE;
                pdfCell.Padding = 5;
                table.AddCell(pdfCell);
            }
        }

        private string FormatCurrency(double amount)
        {
            return string.Format(new CultureInfo("vi-VN"), "{0:N0} VNĐ", amount);
        }
    }
}