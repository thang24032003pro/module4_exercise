<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Từ Điển Anh - Việt Đơn Giản</title>
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
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555555;
        }
        input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #cccccc;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
            outline: none;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus {
            border-color: #667eea;
        }
        button {
            width: 100%;
            background-color: #667eea;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #5a6fd1;
        }
        .sample-words {
            margin-top: 20px;
            font-size: 13px;
            color: #777777;
            text-align: left;
            background: #f8f9fa;
            padding: 10px 15px;
            border-radius: 6px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>📖 Tra Cứu Từ Điển</h2>
    <form action="search" method="post">
        <div class="form-group">
            <label for="word">Nhập từ tiếng Anh cần tra:</label>
            <input type="text" id="word" name="word" placeholder="Ví dụ: hello, world, computer..." required autofocus/>
        </div>
        <button type="submit">Tra cứu</button>
    </form>
    <div class="sample-words">
        <strong>Từ mẫu có sẵn:</strong> hello, world, computer, book, student, teacher, school, apple, cat, dog, car, house, sun, moon, water, coffee...
    </div>
</div>
</body>
</html>

