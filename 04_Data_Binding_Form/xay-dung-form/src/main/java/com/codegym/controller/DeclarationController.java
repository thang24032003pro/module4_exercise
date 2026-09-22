package com.codegym.controller;

import com.codegym.model.MedicalDeclaration;
import com.codegym.service.DeclarationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.Year;
import java.util.*;

@Controller
public class DeclarationController {

    @Autowired
    private DeclarationService declarationService;

    @ModelAttribute("genderList")
    public List<String> getGenderList() {
        return Arrays.asList("Nam", "Nữ", "Khác");
    }

    @ModelAttribute("nationalityList")
    public List<String> getNationalityList() {
        return Arrays.asList("Việt Nam", "Mỹ", "Nhật Bản", "Hàn Quốc", "Trung Quốc", "Anh", "Pháp", "Đức", "Khác");
    }

    @ModelAttribute("vehicleList")
    public List<String> getVehicleList() {
        return Arrays.asList("Tàu bay", "Tàu thuyền", "Ô tô", "Khác");
    }

    @ModelAttribute("birthYearList")
    public List<Integer> getBirthYearList() {
        int currentYear = Year.now().getValue();
        List<Integer> years = new ArrayList<>();
        for (int y = currentYear; y >= 1920; y--) {
            years.add(y);
        }
        return years;
    }

    @GetMapping({"", "/", "/detail"})
    public String showDetail(Model model) {
        model.addAttribute("declaration", declarationService.getCurrentDeclaration());
        return "detail";
    }

    @GetMapping("/edit")
    public String showEditForm(Model model) {
        model.addAttribute("declaration", declarationService.getCurrentDeclaration());
        return "form";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        MedicalDeclaration newDeclaration = new MedicalDeclaration();
        newDeclaration.setNationality("Việt Nam");
        newDeclaration.setGender("Nam");
        model.addAttribute("declaration", newDeclaration);
        return "form";
    }

    @PostMapping("/save")
    public String saveDeclaration(@ModelAttribute("declaration") MedicalDeclaration declaration,
                                  Model model,
                                  RedirectAttributes redirectAttributes) {

        Map<String, String> fieldErrors = new HashMap<>();
        List<String> missingFieldNames = new ArrayList<>();

        if (isEmpty(declaration.getName())) {
            fieldErrors.put("name", "Họ tên không được để trống");
            missingFieldNames.add("Họ tên");
        }
        if (isEmpty(declaration.getBirthYear())) {
            fieldErrors.put("birthYear", "Năm sinh không được để trống");
            missingFieldNames.add("Năm sinh");
        }
        if (isEmpty(declaration.getGender())) {
            fieldErrors.put("gender", "Vui lòng chọn giới tính");
            missingFieldNames.add("Giới tính");
        }
        if (isEmpty(declaration.getNationality())) {
            fieldErrors.put("nationality", "Quốc tịch không được để trống");
            missingFieldNames.add("Quốc tịch");
        }
        if (isEmpty(declaration.getIdCard())) {
            fieldErrors.put("idCard", "Số hộ chiếu / CMND / CCCD không được để trống");
            missingFieldNames.add("Số hộ chiếu / CMND / CCCD");
        }
        if (isEmpty(declaration.getProvince())) {
            fieldErrors.put("province", "Tỉnh / Thành phố không được để trống");
            missingFieldNames.add("Tỉnh / Thành phố");
        }
        if (isEmpty(declaration.getDistrict())) {
            fieldErrors.put("district", "Quận / Huyện không được để trống");
            missingFieldNames.add("Quận / Huyện");
        }
        if (isEmpty(declaration.getWard())) {
            fieldErrors.put("ward", "Phường / Xã không được để trống");
            missingFieldNames.add("Phường / Xã");
        }
        if (isEmpty(declaration.getAddress())) {
            fieldErrors.put("address", "Địa chỉ nơi ở không được để trống");
            missingFieldNames.add("Địa chỉ nơi ở (Số nhà, phố, tổ dân phố/thôn)");
        }
        if (isEmpty(declaration.getPhone())) {
            fieldErrors.put("phone", "Số điện thoại không được để trống");
            missingFieldNames.add("Số điện thoại");
        }

        if (!missingFieldNames.isEmpty()) {
            model.addAttribute("fieldErrors", fieldErrors);
            model.addAttribute("missingFieldNames", missingFieldNames);
            model.addAttribute("declaration", declaration);
            return "form";
        }

        declarationService.updateDeclaration(declaration);
        redirectAttributes.addFlashAttribute("successMessage", "Lưu tờ khai y tế thành công!");
        return "redirect:/detail";
    }

    private boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
