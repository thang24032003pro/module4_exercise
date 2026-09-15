<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Kết Quả Tra Cứu</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 35px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            width: 100%;
            max-width: 450px;
            text-align: center;
        }
        h2 {
            color: #333333;
            margin-bottom: 25px;
        }
        .result-box {
            background-color: #f0fdf4;
            border: 1px solid #bbf7d0;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 25px;
            text-align: left;
        }
        .error-box {
            background-color: #fef2f2;
            border: 1px solid #fecaca;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 25px;
            color: #dc2626;
            text-align: center;
            font-weight: 500;
        }
        .item-label {
            font-size: 14px;
            color: #666666;
            margin-bottom: 4px;
        }
        .item-value {
            font-size: 18px;
            font-weight: 600;
            color: #166534;
            margin-bottom: 12px;
        }
        .item-value:last-child {
            margin-bottom: 0;
        }
        .btn-back {
            display: inline-block;
            background-color: #667eea;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            font-weight: 600;
            border-radius: 6px;
            transition: background-color 0.3s;
        }
        .btn-back:hover {
            background-color: #5a6fd1;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Kết Quả Tra Cứu</h2>

    <c:if test="${not empty meaning}">
        <div class="result-box">
            <div class="item-label">Từ tiếng Anh:</div>
            <div class="item-value" style="color: #333333;">${word}</div>
            <div class="item-label">Nghĩa tiếng Việt:</div>
            <div class="item-value">${meaning}</div>
        </div>
    </c:if>

    <c:if test="${not empty message}">
        <div class="error-box">
            <p style="margin: 0 0 8px 0;"><strong>Từ đã tra:</strong> "${word}"</p>
            <p style="margin: 0;">❌ ${message}</p>
        </div>
    </c:if>

    <a href="${pageContext.request.contextPath}/" class="btn-back">⬅ Tra từ khác</a>
</div>
</body>
</html>

