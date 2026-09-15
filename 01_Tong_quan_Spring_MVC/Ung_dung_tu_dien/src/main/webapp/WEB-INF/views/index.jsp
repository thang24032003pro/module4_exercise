<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>USD to VND Converter</title>
</head>
<body>
    <h1>Chuyển đổi USD sang VNĐ</h1>
    <form action="${pageContext.request.contextPath}/convert" method="post">
        <label>Tỉ giá (VND/USD):</label>
        <input type="number" name="rate" step="0.01" required><br><br>

        <label>Số USD muốn đổi:</label>
        <input type="number" name="usd" step="0.01" required><br><br>

        <button type="submit">Chuyển đổi</button>
    </form>
</body>
</html>
