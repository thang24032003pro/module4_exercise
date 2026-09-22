<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông Tin Tờ Khai Y Tế</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
            color: #2d3748;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #ffffff;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }
        .header {
            text-align: center;
            border-bottom: 2px solid #e2e8f0;
            padding-bottom: 20px;
            margin-bottom: 25px;
        }
        .header h1 {
            color: #2b6cb0;
            margin: 0 0 8px 0;
            font-size: 24px;
            text-transform: uppercase;
        }
        .alert-success {
            background-color: #f0fff4;
            border: 1px solid #9ae6b4;
            border-left: 5px solid #38a169;
            color: #22543d;
            padding: 14px 18px;
            border-radius: 6px;
            margin-bottom: 25px;
            font-size: 15px;
            font-weight: 500;
        }
        .section-title {
            background-color: #edf2f7;
            color: #2d3748;
            padding: 10px 14px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 700;
            margin: 25px 0 12px 0;
            border-left: 4px solid #4a5568;
        }
        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px 20px;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .info-item {
            display: flex;
            border-bottom: 1px solid #edf2f7;
            padding-bottom: 6px;
        }
        .info-label {
            font-weight: 600;
            color: #718096;
            width: 45%;
        }
        .info-value {
            color: #1a202c;
            width: 55%;
            font-weight: 500;
        }
        .tag-list {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-top: 8px;
        }
        .tag {
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }
        .tag-danger {
            background-color: #fed7d7;
            color: #c53030;
        }
        .tag-normal {
            background-color: #e2e8f0;
            color: #4a5568;
        }
        .btn-group {
            margin-top: 35px;
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        .btn {
            padding: 12px 26px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            border: none;
            text-decoration: none;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .btn-primary {
            background-color: #3182ce;
            color: #fff;
        }
        .btn-primary:hover {
            background-color: #2b6cb0;
        }
        .btn-outline {
            background-color: #edf2f7;
            color: #4a5568;
        }
        .btn-outline:hover {
            background-color: #e2e8f0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>THÔNG TIN TỜ KHAI Y TẾ ĐÃ GỬI</h1>
            <p>Thông tin khai báo y tế điện tử</p>
        </div>

        <c:if test="${not empty successMessage}">
            <div class="alert-success">✓ ${successMessage}</div>
        </c:if>

        <c:choose>
            <c:when test="${empty declaration or empty declaration.name}">
                <p style="text-align: center; color: #718096; padding: 30px 0;">
                    Hiện chưa có thông tin tờ khai y tế nào. Vui lòng bấm tạo tờ khai mới.
                </p>
            </c:when>
            <c:otherwise>
                <!-- 1. THÔNG TIN CÁ NHÂN -->
                <div class="section-title">1. Thông tin cá nhân</div>
                <div class="info-grid">
                    <div class="info-item">
                        <span class="info-label">Họ và tên:</span>
                        <span class="info-value"><strong>${declaration.name}</strong></span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Năm sinh:</span>
                        <span class="info-value">${declaration.birthYear}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Giới tính:</span>
                        <span class="info-value">${declaration.gender}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Quốc tịch:</span>
                        <span class="info-value">${declaration.nationality}</span>
                    </div>
                    <div class="info-item" style="grid-column: span 2;">
                        <span class="info-label" style="width: 22.5%;">Số hộ chiếu / CCCD:</span>
                        <span class="info-value">${declaration.idCard}</span>
                    </div>
                </div>

                <!-- 2. THÔNG TIN ĐI LẠI -->
                <div class="section-title">2. Thông tin đi lại</div>
                <div class="info-grid">
                    <div class="info-item">
                        <span class="info-label">Phương tiện:</span>
                        <span class="info-value">${not empty declaration.vehicle ? declaration.vehicle : 'Không'}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Số hiệu:</span>
                        <span class="info-value">${not empty declaration.vehicleNumber ? declaration.vehicleNumber : 'Không'}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Số ghế:</span>
                        <span class="info-value">${not empty declaration.seatNumber ? declaration.seatNumber : 'Không'}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Ngày khởi hành:</span>
                        <span class="info-value">${not empty declaration.departureDate ? declaration.departureDate : 'Không'}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Ngày kết thúc:</span>
                        <span class="info-value">${not empty declaration.arrivalDate ? declaration.arrivalDate : 'Không'}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Lịch sử di chuyển:</span>
                        <span class="info-value">${not empty declaration.travelHistory ? declaration.travelHistory : 'Không'}</span>
                    </div>
                </div>

                <!-- 3. ĐỊA CHỈ LIÊN LẠC -->
                <div class="section-title">3. Địa chỉ liên lạc tại Việt Nam</div>
                <div class="info-grid">
                    <div class="info-item">
                        <span class="info-label">Tỉnh / Thành phố:</span>
                        <span class="info-value">${declaration.province}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Quận / Huyện:</span>
                        <span class="info-value">${declaration.district}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Phường / Xã:</span>
                        <span class="info-value">${declaration.ward}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Điện thoại:</span>
                        <span class="info-value"><strong>${declaration.phone}</strong></span>
                    </div>
                    <div class="info-item" style="grid-column: span 2;">
                        <span class="info-label" style="width: 22.5%;">Địa chỉ nơi ở:</span>
                        <span class="info-value">${declaration.address}</span>
                    </div>
                    <div class="info-item" style="grid-column: span 2;">
                        <span class="info-label" style="width: 22.5%;">Email:</span>
                        <span class="info-value">${not empty declaration.email ? declaration.email : 'Không có'}</span>
                    </div>
                </div>

                <!-- 4. TRIỆU CHỨNG -->
                <div class="section-title">4. Dấu hiệu / Triệu chứng (trong 14 ngày)</div>
                <div class="tag-list">
                    <c:if test="${declaration.fever}"><span class="tag tag-danger">⚠️ Sốt</span></c:if>
                    <c:if test="${declaration.cough}"><span class="tag tag-danger">⚠️ Ho</span></c:if>
                    <c:if test="${declaration.shortnessOfBreath}"><span class="tag tag-danger">⚠️ Khó thở</span></c:if>
                    <c:if test="${declaration.soreThroat}"><span class="tag tag-danger">⚠️ Đau họng</span></c:if>
                    <c:if test="${declaration.vomiting}"><span class="tag tag-danger">⚠️ Nôn / Buồn nôn</span></c:if>
                    <c:if test="${declaration.diarrhea}"><span class="tag tag-danger">⚠️ Tiêu chảy</span></c:if>
                    <c:if test="${declaration.bleeding}"><span class="tag tag-danger">⚠️ Xuất huyết ngoài da</span></c:if>
                    <c:if test="${declaration.rash}"><span class="tag tag-danger">⚠️ Phát ban ngoài da</span></c:if>
                    <c:if test="${not declaration.fever and not declaration.cough and not declaration.shortnessOfBreath and not declaration.soreThroat and not declaration.vomiting and not declaration.diarrhea and not declaration.bleeding and not declaration.rash}">
                        <span class="tag tag-normal">✓ Không có triệu chứng bất thường</span>
                    </c:if>
                </div>

                <!-- 5. LỊCH SỬ PHƠI NHIỄM -->
                <div class="section-title">5. Yếu tố dịch tễ (trong 14 ngày)</div>
                <div class="tag-list">
                    <c:if test="${declaration.contactWithPatient}">
                        <span class="tag tag-danger">⚠️ Tiếp xúc gần người mắc / nghi mắc bệnh</span>
                    </c:if>
                    <c:if test="${declaration.contactWithTraveler}">
                        <span class="tag tag-danger">⚠️ Tiếp xúc người từ vùng có dịch</span>
                    </c:if>
                    <c:if test="${declaration.contactWithSymptomatic}">
                        <span class="tag tag-danger">⚠️ Tiếp xúc người có triệu chứng (sốt, ho, khó thở)</span>
                    </c:if>
                    <c:if test="${not declaration.contactWithPatient and not declaration.contactWithTraveler and not declaration.contactWithSymptomatic}">
                        <span class="tag tag-normal">✓ Không có yếu tố tiếp xúc nguy cơ</span>
                    </c:if>
                </div>
            </c:otherwise>
        </c:choose>

        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/edit" class="btn btn-primary">✏️ Cập Nhật Tờ Khai</a>
            <a href="${pageContext.request.contextPath}/create" class="btn btn-outline">➕ Khai Báo Mới</a>
        </div>
    </div>
</body>
</html>
