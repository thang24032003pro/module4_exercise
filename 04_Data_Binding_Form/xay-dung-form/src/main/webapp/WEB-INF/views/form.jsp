<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tờ Khai Y Tế</title>
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
            color: #c53030;
            margin: 0 0 8px 0;
            font-size: 24px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .header p {
            color: #718096;
            margin: 0;
            font-size: 14px;
        }
        .alert-error {
            background-color: #fff5f5;
            border: 1px solid #feb2b2;
            border-left: 5px solid #e53e3e;
            color: #9b2c2c;
            padding: 15px 20px;
            border-radius: 6px;
            margin-bottom: 25px;
        }
        .alert-error h4 {
            margin: 0 0 8px 0;
            font-size: 15px;
        }
        .alert-error ul {
            margin: 0;
            padding-left: 20px;
            font-size: 14px;
        }
        .section-title {
            background-color: #ebf8ff;
            color: #2b6cb0;
            padding: 10px 14px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 700;
            margin: 25px 0 15px 0;
            border-left: 4px solid #3182ce;
        }
        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
        }
        .form-group {
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        label {
            font-weight: 600;
            font-size: 13px;
            margin-bottom: 6px;
            color: #4a5568;
        }
        .required {
            color: #e53e3e;
        }
        input[type="text"], input[type="date"], select, textarea {
            padding: 9px 12px;
            border: 1px solid #cbd5e0;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s;
            box-sizing: border-box;
            width: 100%;
        }
        input[type="text"]:focus, input[type="date"]:focus, select:focus, textarea:focus {
            border-color: #3182ce;
        }
        .has-error {
            border-color: #e53e3e !important;
            background-color: #fffaf0;
        }
        .field-error {
            color: #e53e3e;
            font-size: 12px;
            margin-top: 4px;
            font-weight: 500;
        }
        .radio-group {
            display: flex;
            gap: 15px;
            align-items: center;
            height: 38px;
        }
        .radio-group label {
            margin-bottom: 0;
            cursor: pointer;
            font-weight: normal;
        }
        table.symptoms-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        table.symptoms-table th, table.symptoms-table td {
            border: 1px solid #e2e8f0;
            padding: 10px 12px;
            text-align: left;
            font-size: 14px;
        }
        table.symptoms-table th {
            background-color: #f7fafc;
            color: #4a5568;
        }
        .center-check {
            text-align: center;
            width: 60px;
        }
        .btn-group {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        .btn {
            padding: 12px 30px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            border: none;
            text-decoration: none;
            transition: background 0.2s;
        }
        .btn-submit {
            background-color: #c53030;
            color: #fff;
        }
        .btn-submit:hover {
            background-color: #9b2c2c;
        }
        .btn-cancel {
            background-color: #edf2f7;
            color: #4a5568;
        }
        .btn-cancel:hover {
            background-color: #e2e8f0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>TỜ KHAI Y TẾ</h1>
            <p>ĐỂ BẢO VỆ SỨC KHỎE CỘNG ĐỒNG, HÃY TRUNG THỰC KHAI BÁO Y TẾ</p>
        </div>

        <c:if test="${not empty missingFieldNames}">
            <div class="alert-error">
                <h4>⚠️ Vui lòng điền đầy đủ các mục thông tin bắt buộc còn thiếu:</h4>
                <ul>
                    <c:forEach var="missing" items="${missingFieldNames}">
                        <li>${missing}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <form:form action="${pageContext.request.contextPath}/save" method="post" modelAttribute="declaration">

            <!-- PHẦN 1: THÔNG TIN CÁ NHÂN -->
            <div class="section-title">1. Thông tin cá nhân</div>

            <div class="form-row">
                <div class="form-group" style="flex: 2;">
                    <label>Họ và tên (chữ in hoa) <span class="required">*</span>:</label>
                    <form:input path="name" cssClass="${not empty fieldErrors['name'] ? 'has-error' : ''}" placeholder="NGUYEN VAN A"/>
                    <c:if test="${not empty fieldErrors['name']}">
                        <span class="field-error">${fieldErrors['name']}</span>
                    </c:if>
                </div>
                <div class="form-group" style="flex: 1;">
                    <label>Năm sinh <span class="required">*</span>:</label>
                    <form:select path="birthYear" cssClass="${not empty fieldErrors['birthYear'] ? 'has-error' : ''}">
                        <form:option value="" label="-- Chọn năm --"/>
                        <form:options items="${birthYearList}"/>
                    </form:select>
                    <c:if test="${not empty fieldErrors['birthYear']}">
                        <span class="field-error">${fieldErrors['birthYear']}</span>
                    </c:if>
                </div>
                <div class="form-group" style="flex: 1;">
                    <label>Giới tính <span class="required">*</span>:</label>
                    <div class="radio-group">
                        <c:forEach var="g" items="${genderList}">
                            <label><form:radiobutton path="gender" value="${g}"/> ${g}</label>
                        </c:forEach>
                    </div>
                    <c:if test="${not empty fieldErrors['gender']}">
                        <span class="field-error">${fieldErrors['gender']}</span>
                    </c:if>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Quốc tịch <span class="required">*</span>:</label>
                    <form:select path="nationality" cssClass="${not empty fieldErrors['nationality'] ? 'has-error' : ''}">
                        <form:options items="${nationalityList}"/>
                    </form:select>
                    <c:if test="${not empty fieldErrors['nationality']}">
                        <span class="field-error">${fieldErrors['nationality']}</span>
                    </c:if>
                </div>
                <div class="form-group">
                    <label>Số hộ chiếu / CMND / CCCD <span class="required">*</span>:</label>
                    <form:input path="idCard" cssClass="${not empty fieldErrors['idCard'] ? 'has-error' : ''}" placeholder="Số CCCD/CMND"/>
                    <c:if test="${not empty fieldErrors['idCard']}">
                        <span class="field-error">${fieldErrors['idCard']}</span>
                    </c:if>
                </div>
            </div>

            <!-- PHẦN 2: THÔNG TIN ĐI LẠI -->
            <div class="section-title">2. Thông tin đi lại (nếu có)</div>

            <div class="form-row">
                <div class="form-group">
                    <label>Phương tiện đi lại:</label>
                    <div class="radio-group">
                        <c:forEach var="v" items="${vehicleList}">
                            <label><form:radiobutton path="vehicle" value="${v}"/> ${v}</label>
                        </c:forEach>
                    </div>
                </div>
                <div class="form-group">
                    <label>Số hiệu phương tiện:</label>
                    <form:input path="vehicleNumber" placeholder="Ví dụ: VN123 / Xe 29B-12345"/>
                </div>
                <div class="form-group">
                    <label>Số ghế:</label>
                    <form:input path="seatNumber" placeholder="Ví dụ: 12A"/>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Ngày khởi hành:</label>
                    <form:input path="departureDate" type="date"/>
                </div>
                <div class="form-group">
                    <label>Ngày kết thúc:</label>
                    <form:input path="arrivalDate" type="date"/>
                </div>
            </div>

            <div class="form-group">
                <label>Trong vòng 14 ngày qua, Anh/Chị có đến tỉnh/thành phố/quốc gia nào không?:</label>
                <form:textarea path="travelHistory" rows="2" placeholder="Ghi rõ các địa điểm đã đi qua (nếu có)..."/>
            </div>

            <!-- PHẦN 3: ĐỊA CHỈ LIÊN LẠC TẠI VIỆT NAM -->
            <div class="section-title">3. Địa chỉ liên lạc tại Việt Nam</div>

            <div class="form-row">
                <div class="form-group">
                    <label>Tỉnh / Thành phố <span class="required">*</span>:</label>
                    <form:input path="province" cssClass="${not empty fieldErrors['province'] ? 'has-error' : ''}" placeholder="Ví dụ: Hà Nội"/>
                    <c:if test="${not empty fieldErrors['province']}">
                        <span class="field-error">${fieldErrors['province']}</span>
                    </c:if>
                </div>
                <div class="form-group">
                    <label>Quận / Huyện <span class="required">*</span>:</label>
                    <form:input path="district" cssClass="${not empty fieldErrors['district'] ? 'has-error' : ''}" placeholder="Ví dụ: Cầu Giấy"/>
                    <c:if test="${not empty fieldErrors['district']}">
                        <span class="field-error">${fieldErrors['district']}</span>
                    </c:if>
                </div>
                <div class="form-group">
                    <label>Phường / Xã <span class="required">*</span>:</label>
                    <form:input path="ward" cssClass="${not empty fieldErrors['ward'] ? 'has-error' : ''}" placeholder="Ví dụ: Dịch Vọng"/>
                    <c:if test="${not empty fieldErrors['ward']}">
                        <span class="field-error">${fieldErrors['ward']}</span>
                    </c:if>
                </div>
            </div>

            <div class="form-group">
                <label>Địa chỉ nơi ở (Số nhà, phố, tổ dân phố / thôn / đội) <span class="required">*</span>:</label>
                <form:input path="address" cssClass="${not empty fieldErrors['address'] ? 'has-error' : ''}" placeholder="Số nhà, tên đường..."/>
                <c:if test="${not empty fieldErrors['address']}">
                    <span class="field-error">${fieldErrors['address']}</span>
                </c:if>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Điện thoại <span class="required">*</span>:</label>
                    <form:input path="phone" cssClass="${not empty fieldErrors['phone'] ? 'has-error' : ''}" placeholder="09xxxxxxxx"/>
                    <c:if test="${not empty fieldErrors['phone']}">
                        <span class="field-error">${fieldErrors['phone']}</span>
                    </c:if>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <form:input path="email" placeholder="example@gmail.com"/>
                </div>
            </div>

            <!-- PHẦN 4: TRIỆU CHỨNG -->
            <div class="section-title">4. Triệu chứng trong vòng 14 ngày qua (Đánh dấu nếu có)</div>
            <table class="symptoms-table">
                <thead>
                    <tr>
                        <th>Triệu chứng</th>
                        <th class="center-check">Có</th>
                        <th>Triệu chứng</th>
                        <th class="center-check">Có</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Sốt</td>
                        <td class="center-check"><form:checkbox path="fever"/></td>
                        <td>Nôn / Buồn nôn</td>
                        <td class="center-check"><form:checkbox path="vomiting"/></td>
                    </tr>
                    <tr>
                        <td>Ho</td>
                        <td class="center-check"><form:checkbox path="cough"/></td>
                        <td>Tiêu chảy</td>
                        <td class="center-check"><form:checkbox path="diarrhea"/></td>
                    </tr>
                    <tr>
                        <td>Khó thở</td>
                        <td class="center-check"><form:checkbox path="shortnessOfBreath"/></td>
                        <td>Xuất huyết ngoài da</td>
                        <td class="center-check"><form:checkbox path="bleeding"/></td>
                    </tr>
                    <tr>
                        <td>Đau họng</td>
                        <td class="center-check"><form:checkbox path="soreThroat"/></td>
                        <td>Phát ban ngoài da</td>
                        <td class="center-check"><form:checkbox path="rash"/></td>
                    </tr>
                </tbody>
            </table>

            <!-- PHẦN 5: LỊCH SỬ PHƠI NHIỄM -->
            <div class="section-title">5. Lịch sử phơi nhiễm trong vòng 14 ngày qua</div>
            <table class="symptoms-table">
                <thead>
                    <tr>
                        <th>Yếu tố dịch tễ</th>
                        <th class="center-check">Có</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Tiếp xúc gần với người mắc bệnh hoặc nghi ngờ mắc bệnh truyền nhiễm</td>
                        <td class="center-check"><form:checkbox path="contactWithPatient"/></td>
                    </tr>
                    <tr>
                        <td>Tiếp xúc với người từ nước/vùng có dịch bệnh truyền nhiễm</td>
                        <td class="center-check"><form:checkbox path="contactWithTraveler"/></td>
                    </tr>
                    <tr>
                        <td>Tiếp xúc với người có biểu hiện sốt, ho, khó thở</td>
                        <td class="center-check"><form:checkbox path="contactWithSymptomatic"/></td>
                    </tr>
                </tbody>
            </table>

            <div class="btn-group">
                <input type="submit" value="Gửi Tờ Khai" class="btn btn-submit"/>
                <a href="${pageContext.request.contextPath}/detail" class="btn btn-cancel">Hủy / Xem tờ khai</a>
            </div>

        </form:form>
    </div>
</body>
</html>
