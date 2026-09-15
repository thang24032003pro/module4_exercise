package com.codegym.emailvalidatemaven.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class HomeController {
    // Regex quy định tính hợp lệ của Email
    private static final String EMAIL_REGEX = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)+$";
    private static final Pattern pattern = Pattern.compile(EMAIL_REGEX);

    @GetMapping("/")
    public String home() {
        return "home"; // Trả về trang chủ (nhập form)
    }

    @PostMapping("/validate")
    public String validateEmail(@RequestParam("email") String email, Model model) {
        Matcher matcher = pattern.matcher(email);
        if (!matcher.matches()) {
            // Nếu email không hợp lệ, đẩy thông báo lỗi xuống View
            model.addAttribute("message", "Email is invalid. Please try again!");
            return "home";
        }
        // Nếu hợp lệ, truyền email qua trang success
        model.addAttribute("email", email);
        return "success";
    }
}
