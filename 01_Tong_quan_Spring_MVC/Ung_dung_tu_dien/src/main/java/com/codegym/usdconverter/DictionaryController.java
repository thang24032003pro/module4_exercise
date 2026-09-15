package com.codegym.dictionary;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
public class DictionaryController {

    private static final Map<String, String> dictionary = new HashMap<>();

    static {
        dictionary.put("hello", "Xin chào");
        dictionary.put("world", "Thế giới");
        dictionary.put("computer", "Máy tính");
        dictionary.put("book", "Quyển sách");
        dictionary.put("student", "Học sinh");
        dictionary.put("teacher", "Giáo viên");
        dictionary.put("school", "Trường học");
        dictionary.put("apple", "Quả táo");
        dictionary.put("cat", "Con mèo");
        dictionary.put("dog", "Con chó");
        dictionary.put("car", "Xe ô tô");
        dictionary.put("house", "Ngôi nhà");
        dictionary.put("sun", "Mặt trời");
        dictionary.put("moon", "Mặt trăng");
        dictionary.put("water", "Nước");
        dictionary.put("coffee", "Cà phê");
    }

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @PostMapping("/search")
    public String search(@RequestParam("word") String word, Model model) {
        String searchKey = (word != null) ? word.trim().toLowerCase() : "";
        String meaning = dictionary.get(searchKey);

        model.addAttribute("word", word);

        if (meaning != null) {
            model.addAttribute("meaning", meaning);
        } else {
            model.addAttribute("message", "Không tìm thấy từ này trong từ điển!");
        }

        return "result";
    }

    @GetMapping("/search")
    public String searchGet(@RequestParam(value = "word", required = false) String word, Model model) {
        if (word == null || word.trim().isEmpty()) {
            return "index";
        }
        return search(word, model);
    }
}
