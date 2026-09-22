<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://jakarta.apache.org/taglibs/standard/permutation" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cấu hình Hòm thư điện tử</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 40px 20px;
            color: #333;
        }
        .container {
            max-width: 550px;
            margin: 0 auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }
        h2 {
            margin-top: 0;
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 12px;
            font-size: 22px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            color: #495057;
        }
        select, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            font-size: 14px;
            box-sizing: border-box;
            background-color: #fff;
            transition: border-color 0.2s;
        }
        select:focus, textarea:focus {
            outline: none;
            border-color: #3498db;
        }
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }
        .checkbox-group label {
            margin-bottom: 0;
            cursor: pointer;
            font-weight: normal;
        }
        .actions {
            margin-top: 25px;
            display: flex;
            gap: 10px;
        }
        .btn {
            padding: 10px 22px;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background 0.2s;
        }
        .btn-primary {
            background-color: #3498db;
            color: #fff;
        }
        .btn-primary:hover {
            background-color: #2980b9;
        }
        .btn-secondary {
            background-color: #95a5a6;
            color: #fff;
        }
        .btn-secondary:hover {
            background-color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>⚙️ Settings: Mailbox Configuration</h2>
        <form:form action="settings" method="post" modelAttribute="emailConfig">
            <div class="form-group">
                <label for="language">Languages:</label>
                <form:select path="language" id="language">
                    <form:options items="${languages}"/>
                </form:select>
            </div>

            <div class="form-group">
                <label for="pageSize">Page Size:</label>
                <form:select path="pageSize" id="pageSize">
                    <form:options items="${pageSizes}"/>
                </form:select>
                <small style="color: #6c757d;">emails per page</small>
            </div>

            <div class="form-group">
                <label>Spams Filter:</label>
                <div class="checkbox-group">
                    <form:checkbox path="spamsFilter" id="spamsFilter"/>
                    <label for="spamsFilter">Enable spams filter</label>
                </div>
            </div>

            <div class="form-group">
                <label for="signature">Signature:</label>
                <form:textarea path="signature" id="signature" rows="4"/>
            </div>

            <div class="actions">
                <input type="submit" value="Update" class="btn btn-primary"/>
                <a href="info" class="btn btn-secondary">Cancel</a>
            </div>
        </form:form>
    </div>
</body>
</html>
