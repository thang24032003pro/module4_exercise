<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết Quả Tính Lương</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background-color: #f4f7f6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        .card {
            background: #ffffff;
            width: 100%;
            max-width: 480px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
        }
        .card h2 {
            color: #27ae60;
            text-align: center;
            margin-bottom: 25px;
            font-size: 22px;
        }
        .result-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }
        .result-table th, .result-table td {
            padding: 12px 14px;
            text-align: left;
            border-bottom: 1px solid #edf2f7;
            font-size: 15px;
        }
        .result-table th {
            color: #7f8c8d;
            font-weight: 500;
            width: 45%;
        }
        .result-table td {
            color: #2c3e50;
            font-weight: 600;
        }
        .highlight-row {
            background-color: #e8f8f0;
        }
        .highlight-row th, .highlight-row td {
            color: #27ae60 !important;
            font-size: 17px !important;
            font-weight: 700 !important;
        }
        .btn-back {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #7f8c8d;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: bold;
            transition: background-color 0.2s;
        }
        .btn-back:hover {
            background-color: #636e72;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>KẾT QUẢ TÍNH LƯƠNG</h2>

    <table class="result-table">
        <tr>
            <th>Ca sáng:</th>
            <td>${shiftHours[0]} giờ</td>
        </tr>
        <tr>
            <th>Ca chiều:</th>
            <td>${shiftHours[1]} giờ</td>
        </tr>
        <tr>
            <th>Ca tối:</th>
            <td>${shiftHours[2]} giờ</td>
        </tr>
        <tr>
            <th>Tổng số giờ làm:</th>
            <td><strong>${totalHours}</strong> giờ</td>
        </tr>
        <tr>
            <th>Mức lương / giờ:</th>
            <td><fmt:formatNumber value="${hourlyRate}" type="currency" currencySymbol="VNĐ" maxFractionDigits="0"/></td>
        </tr>
        <tr class="highlight-row">
            <th>Tổng tiền lương:</th>
            <td><fmt:formatNumber value="${totalSalary}" type="currency" currencySymbol="VNĐ" maxFractionDigits="0"/></td>
        </tr>
    </table>

    <a href="${pageContext.request.contextPath}/" class="btn-back">⬅ Quay lại trang nhập liệu</a>
</div>

</body>
</html>
