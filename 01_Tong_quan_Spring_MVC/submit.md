# Bài 1: Spring MVC Greeting

## Mục tiêu
- Tạo ứng dụng Spring MVC cơ bản
- Cấu hình `DispatcherServlet`, `ViewResolver`
- Hiển thị lời chào và nhận tham số `name` từ URL

## Mã chính
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

## Chạy
```bash
gradle clean war
```

- `/greeting` => `Hello Spring MVC`
- `/greeting?name=John` => `Hello: John`

## Kết luận
Dự án Spring MVC đã được tạo và build thành công bằng Gradle. File WAR sinh ra ở `build/libs/spring-greeting.war`.
