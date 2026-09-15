<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tính Lương Nhân Viên Theo Ca</title>
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
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            font-size: 22px;
        }
        .form-group {
            margin-bottom: 18px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #34495e;
            font-size: 14px;
        }
        input[type="number"], select {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #dcdfe6;
            border-radius: 6px;
            font-size: 15px;
            color: #333;
            transition: border-color 0.2s;
        }
        input[type="number"]:focus, select:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
        }
        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.2s;
        }
        .btn-submit:hover {
            background-color: #2980b9;
        }
        .hint {
            font-size: 12px;
            color: #7f8c8d;
            margin-top: 4px;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>ỨNG DỤNG TÍNH LƯƠNG NHÂN VIÊN</h2>

    <form action="${pageContext.request.contextPath}/calculate" method="post">
        <div class="form-group">
            <label for="shift1">1. Số giờ làm - Ca sáng:</label>
            <input type="number" id="shift1" name="shiftHours" step="0.1" min="0" max="24" placeholder="Nhập số giờ (VD: 8)" required>
        </div>

        <div class="form-group">
            <label for="shift2">2. Số giờ làm - Ca chiều:</label>
            <input type="number" id="shift2" name="shiftHours" step="0.1" min="0" max="24" placeholder="Nhập số giờ (VD: 7.5)" required>
        </div>

        <div class="form-group">
            <label for="shift3">3. Số giờ làm - Ca tối:</label>
            <input type="number" id="shift3" name="shiftHours" step="0.1" min="0" max="24" placeholder="Nhập số giờ (VD: 4)" required>
        </div>

        <div class="form-group">
            <label for="hourlyRate">4. Chọn mức lương theo giờ (VNĐ/giờ):</label>
            <select id="hourlyRate" name="hourlyRate" required>
                <option value="25000">25,000 VNĐ / giờ</option>
                <option value="30000" selected>30,000 VNĐ / giờ</option>
                <option value="50000">50,000 VNĐ / giờ</option>
                <option value="80000">80,000 VNĐ / giờ</option>
                <option value="100000">100,000 VNĐ / giờ</option>
            </select>
            <div class="hint">* Mức lương áp dụng chung cho tổng số giờ của cả 3 ca.</div>
        </div>

        <button type="submit" class="btn-submit">Tính Lương</button>
    </form>
</div>

</body>
</html>

