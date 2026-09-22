<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách bài hát</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 40px 20px;
            color: #333;
        }
        .container {
            max-width: 960px;
            margin: 0 auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.08);
        }
        .header-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #e9ecef;
            padding-bottom: 18px;
            margin-bottom: 25px;
        }
        h2 {
            margin: 0;
            color: #2c3e50;
            font-size: 24px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            border-radius: 6px;
            cursor: pointer;
            border: none;
            transition: all 0.2s ease-in-out;
        }
        .btn-primary {
            background-color: #27ae60;
            color: #fff;
        }
        .btn-primary:hover {
            background-color: #219150;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            padding: 12px 16px;
            border-radius: 6px;
            margin-bottom: 20px;
            border-left: 5px solid #28a745;
            font-size: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            padding: 14px 16px;
            text-align: left;
            border-bottom: 1px solid #edf2f7;
        }
        th {
            background-color: #f7fafc;
            color: #4a5568;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        tr:hover {
            background-color: #f8fafc;
        }
        .badge {
            display: inline-block;
            padding: 3px 8px;
            font-size: 12px;
            background-color: #e2e8f0;
            color: #4a5568;
            border-radius: 12px;
            margin-right: 4px;
            margin-bottom: 4px;
        }
        .audio-player {
            width: 240px;
            height: 36px;
        }
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #718096;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-bar">
            <h2>🎵 Danh Sách Bài Hát Đã Upload</h2>
            <a href="songs/create" class="btn btn-primary">+ Upload Bài Hát Mới</a>
        </div>

        <c:if test="${not empty message}">
            <div class="alert-success">✓ ${message}</div>
        </c:if>

        <c:choose>
            <c:when test="${empty songs}">
                <div class="empty-state">
                    Chưa có bài hát nào được upload. Hãy bấm <strong>+ Upload Bài Hát Mới</strong> để thêm bài hát đầu tiên!
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th style="width: 5%;">#</th>
                            <th style="width: 25%;">Tên Bài Hát</th>
                            <th style="width: 20%;">Nghệ Sĩ</th>
                            <th style="width: 25%;">Thể Loại</th>
                            <th style="width: 25%;">Tệp Âm Thanh</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="song" items="${songs}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td><strong>${song.name}</strong></td>
                                <td>${song.artist}</td>
                                <td>
                                    <c:forEach var="genre" items="${song.genres}">
                                        <span class="badge">${genre}</span>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty song.filePath}">
                                            <audio class="audio-player" controls preload="none">
                                                <source src="audio/${song.filePath}">
                                                Trình duyệt không hỗ trợ audio element.
                                            </audio>
                                            <div style="font-size: 11px; color: #718096; margin-top: 4px;">
                                                📁 ${song.filePath}
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <span style="color: #a0aec0;">Chưa có file</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
