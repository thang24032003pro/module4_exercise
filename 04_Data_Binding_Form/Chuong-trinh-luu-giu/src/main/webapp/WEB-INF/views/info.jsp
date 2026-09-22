<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết Cấu hình Hòm thư</title>
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
            border-bottom: 2px solid #2ecc71;
            padding-bottom: 12px;
            font-size: 22px;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            padding: 12px 16px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 14px;
            border-left: 4px solid #28a745;
        }
        .detail-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }
        .detail-table th, .detail-table td {
            padding: 12px 14px;
            text-align: left;
            border-bottom: 1px solid #e9ecef;
            font-size: 15px;
        }
        .detail-table th {
            width: 35%;
            color: #495057;
            background-color: #f8f9fa;
        }
        .badge {
            display: inline-block;
            padding: 4px 10px;
            font-size: 12px;
            font-weight: 600;
            border-radius: 20px;
        }
        .badge-enabled {
            background-color: #e8f5e9;
            color: #2e7d32;
        }
        .badge-disabled {
            background-color: #ffebee;
            color: #c62828;
        }
        pre.signature-box {
            background: #f8f9fa;
            border: 1px dashed #ced4da;
            padding: 10px;
            border-radius: 6px;
            margin: 0;
            white-space: pre-wrap;
            font-family: inherit;
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
            background-color: #3498db;
            color: #fff;
            transition: background 0.2s;
        }
        .btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📬 Mailbox Configuration Details</h2>

        <c:if test="${not empty message}">
            <div class="alert-success">✓ ${message}</div>
        </c:if>

        <table class="detail-table">
            <tr>
                <th>Languages:</th>
                <td><strong>${config.language}</strong></td>
            </tr>
            <tr>
                <th>Page Size:</th>
                <td>${config.pageSize} emails per page</td>
            </tr>
            <tr>
                <th>Spams Filter:</th>
                <td>
                    <c:choose>
                        <c:when test="${config.spamsFilter}">
                            <span class="badge badge-enabled">✓ Enabled</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-disabled">✕ Disabled</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>Signature:</th>
                <td>
                    <pre class="signature-box">${config.signature}</pre>
                </td>
            </tr>
        </table>

        <a href="settings" class="btn">✏️ Edit Settings</a>
    </div>
</body>
</html>
