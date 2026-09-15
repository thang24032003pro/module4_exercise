# Bài Tập: Ứng Dụng Tính Lương Nhân Viên Theo Ca (Spring MVC)

## 1. Mục tiêu
- Luyện tập tạo Controller xử lý dữ liệu gửi qua HTTP POST method.
- Sử dụng `@RequestParam` để hứng mảng các giá trị số (`double[] shiftHours`) đại diện cho số giờ làm việc theo 3 ca: Ca sáng, Ca chiều, Ca tối.
- Nhận `@RequestParam("hourlyRate") double hourlyRate` để lấy mức lương theo giờ.
- Thực hiện tính toán logic ở Back-end: `totalHours` và `totalSalary = totalHours * hourlyRate`.
- Đưa dữ liệu sang View bằng `Model` và hiển thị kết quả bằng Expression Language (EL) & JSTL.

## 2. Công nghệ sử dụng
- **Java**: 17+
- **Spring Framework**: Spring Web MVC 6.2.6
- **Servlet API**: Jakarta Servlet API 6.0.0 (Tomcat 10.1+)
- **View Template**: JSP & JSTL (Jakarta JSTL 3.0)
- **Build Tool**: Maven

## 3. Cấu trúc thư mục
```text
Bai_tap/
├── pom.xml
├── README.md
└── src/
    └── main/
        ├── java/
        │   └── com/codegym/salarycalculator/controller/
        │       └── SalaryController.java
        └── webapp/
            └── WEB-INF/
                ├── configs/
                │   └── spring-config-mvc.xml
                ├── views/
                │   ├── index.jsp
                │   └── result.jsp
                └── web.xml
```

## 4. Hướng dẫn chạy và kiểm thử
1. Mở terminal tại thư mục `Bai_tap/` và chạy lệnh đóng gói:
   ```bash
   mvn clean package
   ```
2. File WAR `salary-calculator.war` sẽ được tạo trong thư mục `Bai_tap/target/`.
3. Triển khai file `.war` lên máy chủ Apache Tomcat 10.1+ (hoặc chạy trực tiếp trên IDE).
4. Truy cập ứng dụng tại:
   `http://localhost:8080/salary-calculator/`
5. Nhập số giờ làm cho 3 ca (ví dụ: `8`, `7.5`, `4`) và chọn mức lương `30,000 VNĐ / giờ`.
6. Bấm **"Tính Lương"** để xem kết quả chi tiết.
