# Ứng Dụng Kiểm Tra Email Hợp Lệ (Email Validate - Spring MVC)

## 1. Giới thiệu
Dự án thực hành xây dựng ứng dụng web Java sử dụng **Spring MVC 6.2.6**, **Jakarta EE 10** và đóng gói dưới dạng file WAR bằng **Maven**. Ứng dụng cung cấp chức năng kiểm tra tính hợp lệ của địa chỉ email thông qua Regular Expression (Regex).

## 2. Công nghệ sử dụng
- **Java**: 17+
- **Spring Framework**: Spring Web MVC 6.2.6
- **Servlet API**: Jakarta Servlet API 6.0.0 (Tomcat 10.1+)
- **View Template**: JSP & JSTL (Jakarta JSTL 3.0)
- **Build Tool**: Maven

## 3. Cấu trúc thư mục
```text
02_Spring_Controller/
├── pom.xml
├── src
│   └── main
│       ├── java
│       │   └── com
│       │       └── codegym
│       │           └── emailvalidatemaven
│       │               └── controller
│       │                   └── HomeController.java
│       └── webapp
│           └── WEB-INF
│               ├── configs
│               │   └── spring-config-mvc.xml
│               ├── views
│               │   ├── home.jsp
│               │   └── success.jsp
│               └── web.xml
└── README.md
```

## 4. Hướng dẫn chạy ứng dụng
1. Build file WAR:
   ```bash
   mvn clean package
   ```
2. File WAR `email-validate-maven.war` sẽ được sinh ra trong thư mục `target/`.
3. Deploy file WAR vào Apache Tomcat 10.1+ (copy vào thư mục `webapps/` của Tomcat hoặc cấu hình trên IDE).
4. Truy cập ứng dụng tại:
   `http://localhost:8080/email-validate-maven/`

