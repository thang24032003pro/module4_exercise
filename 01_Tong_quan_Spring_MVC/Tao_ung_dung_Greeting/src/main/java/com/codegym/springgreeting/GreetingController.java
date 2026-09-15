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
