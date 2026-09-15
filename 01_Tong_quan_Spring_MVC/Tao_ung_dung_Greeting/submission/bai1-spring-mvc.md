# Bài 1: Spring MVC - Greeting App

## Mục tiêu
- Tạo ứng dụng Spring MVC cơ bản
- Cấu hình Spring MVC với DispatcherServlet và ViewResolver
- Hiển thị lời chào mặc định và nhận tham số `name` từ URL

## Mã nguồn chính

### `GreetingController.java`
```java
package com.codegym.springgreeting;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GreetingController {

    @GetMapping("/greeting")
    public String greeting(Model model) {
        model.addAttribute("message", "Hello Spring MVC");
        return "index";
    }

    @GetMapping(value = "/greeting", params = "name")
    public String greetingWithName(@RequestParam("name") String name, Model model) {
        model.addAttribute("message", "Hello: " + name);
        return "index";
    }
}
```

### `index.jsp`
```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Greeting</title>
</head>
<body>
    <h1>${message}</h1>
</body>
</html>
```

## Cấu hình Spring MVC
- `dispatcher-servlet.xml`
- `web.xml`
- `applicationContext.xml`

## Chạy ứng dụng
1. `gradle clean war`
2. Copy file `build/libs/spring-greeting.war` vào `webapps` của Tomcat
3. Khởi động Tomcat
4. Truy cập:
   - `http://localhost:8080/spring-greeting/greeting`
   - `http://localhost:8080/spring-greeting/greeting?name=John`

## Kết quả mong đợi
- `/greeting` -> `Hello Spring MVC`
- `/greeting?name=John` -> `Hello: John`

## Ghi chú
Dự án đã được xây dựng thành công bằng Gradle và file WAR đã được tạo trong `build/libs`.
