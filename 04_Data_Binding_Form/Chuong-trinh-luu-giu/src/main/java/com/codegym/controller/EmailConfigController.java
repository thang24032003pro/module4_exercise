package com.codegym.controller;

import com.codegym.model.EmailConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

@Controller
public class EmailConfigController {

    private EmailConfig currentConfig = new EmailConfig("English", 25, false, "Thor\nKing, Asgard");

    @ModelAttribute("languages")
    public List<String> getLanguages() {
        return Arrays.asList("English", "Vietnamese", "Japanese", "Chinese");
    }

    @ModelAttribute("pageSizes")
    public List<Integer> getPageSizes() {
        return Arrays.asList(5, 10, 15, 25, 50, 100);
    }

    @GetMapping({"/", "/settings"})
    public String showSettingsForm(Model model) {
        model.addAttribute("emailConfig", currentConfig);
        return "settings";
    }

    @PostMapping("/settings")
    public ModelAndView updateSettings(@ModelAttribute("emailConfig") EmailConfig emailConfig) {
        this.currentConfig = emailConfig;
        ModelAndView modelAndView = new ModelAndView("info");
        modelAndView.addObject("config", currentConfig);
        modelAndView.addObject("message", "Cập nhật cấu hình thành công!");
        return modelAndView;
    }

    @GetMapping("/info")
    public ModelAndView showInfo() {
        ModelAndView modelAndView = new ModelAndView("info");
        modelAndView.addObject("config", currentConfig);
        return modelAndView;
    }
}
