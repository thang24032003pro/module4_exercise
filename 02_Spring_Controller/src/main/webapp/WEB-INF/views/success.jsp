<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Validation Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .container {
            max-width: 400px;
            padding: 20px;
            border: 1px solid #28a745;
            border-radius: 8px;
            background-color: #e8f5e9;
        }
        h2 {
            color: #28a745;
        }
        a {
            display: inline-block;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Success!</h2>
    <p>The email <strong>${email}</strong> is valid.</p>
    <a href="${pageContext.request.contextPath}/">Back to Home</a>
</div>
</body>
</html>

