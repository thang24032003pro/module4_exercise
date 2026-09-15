<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Greeting - Spring MVC</title>
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
        .card {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 450px;
            width: 100%;
        }
        h1 {
            color: #333333;
            margin-bottom: 20px;
        }
        .greeting-name {
            color: #667eea;
            font-weight: bold;
        }
        form {
            margin-top: 25px;
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        input[type="text"] {
            padding: 10px 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            flex: 1;
            outline: none;
        }
        input[type="text"]:focus {
            border-color: #667eea;
        }
        button {
            background-color: #667eea;
            color: white;
            border: none;
            padding: 10px 18px;
            font-size: 15px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }
        button:hover {
            background-color: #5a6fd1;
        }
        .hint {
            margin-top: 15px;
            font-size: 13px;
            color: #777;
        }
    </style>
</head>
<body>
<div class="card">
    <h1>Hello: <span class="greeting-name">${name}</span></h1>

    <form action="${pageContext.request.contextPath}/greeting" method="get">
        <input type="text" name="name" placeholder="Nhập tên của bạn..." />
        <button type="submit">Gửi</button>
    </form>

    <div class="hint">
        Thử truy cập: <code>/greeting?name=John</code>
    </div>
</div>
</body>
</html>

