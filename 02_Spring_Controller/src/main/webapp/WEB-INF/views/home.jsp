<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Email Validate</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .container {
            max-width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Email Validation</h2>
    <c:if test="${not empty message}">
        <div class="error">${message}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/validate" method="post">
        <div class="form-group">
            <label for="email">Email Address:</label>
            <input type="text" id="email" name="email" placeholder="Enter email to validate..." required/>
        </div>
        <input type="submit" value="Validate"/>
    </form>
</div>
</body>
</html>

