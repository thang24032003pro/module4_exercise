<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload Bài Hát Mới</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 40px 20px;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.08);
        }
        h2 {
            margin-top: 0;
            color: #2c3e50;
            border-bottom: 2px solid #27ae60;
            padding-bottom: 12px;
            font-size: 22px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #4a5568;
        }
        .form-control {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #cbd5e0;
            border-radius: 6px;
            font-size: 15px;
            box-sizing: border-box;
            transition: border-color 0.2s;
        }
        .form-control:focus {
            outline: none;
            border-color: #27ae60;
        }
        .checkbox-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 8px;
            background: #f8fafc;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #edf2f7;
        }
        .checkbox-container label {
            font-weight: normal;
            margin-bottom: 0;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 14px;
        }
        .file-upload-box {
            border: 2px dashed #cbd5e0;
            padding: 16px;
            border-radius: 8px;
            background: #f8fafc;
            text-align: center;
        }
        .file-upload-box input[type="file"] {
            font-size: 14px;
        }
        .hint {
            font-size: 12px;
            color: #718096;
            margin-top: 6px;
        }
        .error-msg {
            color: #e53e3e;
            font-size: 13px;
            margin-top: 5px;
            font-weight: 500;
        }
        .alert-danger {
            background-color: #fed7d7;
            color: #9b2c2c;
            padding: 12px 16px;
            border-radius: 6px;
            margin-bottom: 20px;
            border-left: 5px solid #e53e3e;
            font-size: 14px;
        }
        .actions {
            margin-top: 25px;
            display: flex;
            gap: 12px;
        }
        .btn {
            padding: 10px 22px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            border: none;
            transition: all 0.2s;
        }
        .btn-success {
            background-color: #27ae60;
            color: #fff;
        }
        .btn-success:hover {
            background-color: #219150;
        }
        .btn-secondary {
            background-color: #a0aec0;
            color: #fff;
        }
        .btn-secondary:hover {
            background-color: #718096;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>⬆️ Upload Bài Hát Mới</h2>

        <c:if test="${not empty fileError}">
            <div class="alert-danger">⚠️ ${fileError}</div>
        </c:if>

        <form:form action="${pageContext.request.contextPath}/songs/save"
                   method="post"
                   modelAttribute="songForm"
                   enctype="multipart/form-data">

            <div class="form-group">
                <label for="name">Tên bài hát <span style="color:red;">*</span>:</label>
                <form:input path="name" id="name" cssClass="form-control" placeholder="Nhập tên bài hát..."/>
                <c:if test="${not empty nameError}">
                    <div class="error-msg">${nameError}</div>
                </c:if>
            </div>

            <div class="form-group">
                <label for="artist">Nghệ sĩ thể hiện <span style="color:red;">*</span>:</label>
                <form:input path="artist" id="artist" cssClass="form-control" placeholder="Nhập tên ca sĩ / nhóm nhạc..."/>
                <c:if test="${not empty artistError}">
                    <div class="error-msg">${artistError}</div>
                </c:if>
            </div>

            <div class="form-group">
                <label>Thể loại nhạc (chọn một hoặc nhiều) <span style="color:red;">*</span>:</label>
                <div class="checkbox-container">
                    <form:checkboxes path="genres" items="${genreList}"/>
                </div>
                <c:if test="${not empty genreError}">
                    <div class="error-msg">${genreError}</div>
                </c:if>
            </div>

            <div class="form-group">
                <label>File bài hát <span style="color:red;">*</span>:</label>
                <div class="file-upload-box">
                    <input type="file" name="songFile" accept=".mp3,.wav,.ogg,.m4p" required/>
                    <div class="hint">📌 Chỉ chấp nhận các định dạng âm thanh: <strong>.mp3, .wav, .ogg, .m4p</strong></div>
                </div>
            </div>

            <div class="actions">
                <input type="submit" value="Upload Bài Hát" class="btn btn-success"/>
                <a href="${pageContext.request.contextPath}/songs" class="btn btn-secondary">Quay lại danh sách</a>
            </div>
        </form:form>
    </div>
</body>
</html>
