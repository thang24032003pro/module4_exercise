# Bài 1: Spring MVC - Greeting App

## Mục tiêu
- Tạo ứng dụng Spring MVC cơ bản chạy trên Tomcat 10+
- Cấu hình DispatcherServlet, ViewResolver và controller
- Hiển thị lời chào mặc định và nhận tham số name từ URL

## Kết quả đã hoàn thành
Dự án đã được tạo và build thành công bằng Gradle.

Xác nhận build thực tế:
- Command: gradle clean war
- Kết quả: BUILD SUCCESSFUL in 2s
- File WAR được sinh ra: build/libs/spring-greeting.war

## Cấu trúc dự án
- build.gradle
- settings.gradle
- src/main/java/com/codegym/springgreeting/GreetingController.java
- src/main/webapp/WEB-INF/web.xml
- src/main/webapp/WEB-INF/dispatcher-servlet.xml
- src/main/webapp/WEB-INF/applicationContext.xml
- src/main/webapp/WEB-INF/views/index.jsp

## File Java controller
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

## File JSP
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
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           http://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context
                           http://www.springframework.org/schema/context/spring-context.xsd
                           http://www.springframework.org/schema/mvc
                           http://www.springframework.org/schema/mvc/spring-mvc.xsd">

    <context:component-scan base-package="com.codegym.springgreeting"/>
    <mvc:annotation-driven/>

    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/views/"/>
        <property name="suffix" value=".jsp"/>
    </bean>
</beans>
```

## Hướng dẫn chạy
1. Build project:
   gradle clean war
2. Copy file build/libs/spring-greeting.war vào thư mục webapps của Tomcat
3. Khởi động Tomcat
4. Truy cập:
   - http://localhost:8080/spring-greeting/greeting
   - http://localhost:8080/spring-greeting/greeting?name=John

## Kết quả mong đợi
- /greeting => Hello Spring MVC
- /greeting?name=John => Hello: John

## Nộp bài
- Dự án đã được lưu trong workspace hiện tại
- Có thể đẩy lên GitHub để nộp link

