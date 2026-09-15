package com.codegym.usdconverter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CurrencyController {

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @PostMapping("/convert")
    public String convert(@RequestParam double rate,
                          @RequestParam double usd,
                          Model model) {
        double vnd = usd * rate;
        model.addAttribute("rate", rate);
        model.addAttribute("usd", usd);
        model.addAttribute("vnd", vnd);
        return "result";
    }
}
