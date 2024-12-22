using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.Linq;

namespace API_HomeStay_HUB.Helpers
{
    public class ExportExcel
    {
        public ExportExcel()
        {
            // Set the LicenseContext property before using EPPlus
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial; // or LicenseContext.Commercial
        }

        // Hàm xuất Excel từ danh sách dữ liệu với tên cột, header và footer tùy chỉnh
        public byte[] ExportToExcel<T>(
            List<T> data,
            List<string> columnNames,
            string fileName,
            string headerText = "",
            string footerText = "")
        {
            using (var package = new ExcelPackage())
            {
                // Tạo worksheet mới
                var worksheet = package.Workbook.Worksheets.Add("Sheet1");

                int currentRow = 1;

                // Thêm phần Header (Tùy chỉnh) ở dòng đầu tiên
                if (!string.IsNullOrEmpty(headerText))
                {
                    worksheet.Cells[currentRow, 1].Value = headerText;
                    worksheet.Cells[currentRow, 1].Style.Font.Size = 16;
                    worksheet.Cells[currentRow, 1].Style.Font.Bold = true;
                    worksheet.Cells[currentRow, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    worksheet.Cells[currentRow, 1, currentRow, columnNames.Count].Merge = true; // Merge toàn bộ cột cho header
                    currentRow++;
                }

                // Đặt tên các cột (header)
                for (int col = 0; col < columnNames.Count; col++)
                {
                    worksheet.Cells[currentRow, col + 1].Value = columnNames[col];
                    worksheet.Cells[currentRow, col + 1].Style.Font.Bold = true;
                    worksheet.Cells[currentRow, col + 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    worksheet.Cells[currentRow, col + 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                }
                currentRow++;

                // Điền dữ liệu vào các ô
                var properties = typeof(T).GetProperties();
                for (int row = 0; row < data.Count; row++)
                {
                    for (int col = 0; col < properties.Length; col++)
                    {
                        // Đảm bảo chỉ điền vào các cột được chỉ định trong danh sách tên cột
                        if (col < columnNames.Count)
                        {
                            var value = properties[col].GetValue(data[row]);
                            worksheet.Cells[currentRow + row, col + 1].Value = value;
                            worksheet.Cells[currentRow + row, col + 1].Style.Border.BorderAround(ExcelBorderStyle.Thin);
                        }
                    }
                }

                // Tự động căn chỉnh kích thước cột
                for (int col = 1; col <= columnNames.Count; col++)
                {
                    worksheet.Column(col).AutoFit();
                }

                // Thêm phần Footer (Tùy chỉnh) ở cuối
                if (!string.IsNullOrEmpty(footerText))
                {
                    int lastRow = currentRow + data.Count; // Tính toán vị trí dòng cuối
                    worksheet.Cells[lastRow, 1].Value = footerText;
                    worksheet.Cells[lastRow, 1].Style.Font.Size = 10;
                    worksheet.Cells[lastRow, 1].Style.Font.Italic = true;
                    worksheet.Cells[lastRow, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    worksheet.Cells[lastRow, 1, lastRow, columnNames.Count].Merge = true; // Merge toàn bộ cột cho footer
                }

                // Trả về mảng byte của file Excel
                return package.GetAsByteArray();
            }
        }
    }
}
