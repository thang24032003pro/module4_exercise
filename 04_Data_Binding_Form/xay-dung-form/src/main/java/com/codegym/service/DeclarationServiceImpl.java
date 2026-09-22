package com.codegym.service;

import com.codegym.model.MedicalDeclaration;
import org.springframework.stereotype.Service;

@Service
public class DeclarationServiceImpl implements DeclarationService {

    private MedicalDeclaration currentDeclaration;

    public DeclarationServiceImpl() {
        currentDeclaration = new MedicalDeclaration();
        currentDeclaration.setName("Nguyễn Văn An");
        currentDeclaration.setBirthYear("1995");
        currentDeclaration.setGender("Nam");
        currentDeclaration.setNationality("Việt Nam");
        currentDeclaration.setIdCard("001195012345");
        currentDeclaration.setVehicle("Tàu bay");
        currentDeclaration.setVehicleNumber("VN-123");
        currentDeclaration.setSeatNumber("12A");
        currentDeclaration.setDepartureDate("2026-09-15");
        currentDeclaration.setArrivalDate("2026-09-15");
        currentDeclaration.setProvince("Hà Nội");
        currentDeclaration.setDistrict("Cầu Giấy");
        currentDeclaration.setWard("Dịch Vọng");
        currentDeclaration.setAddress("Số 10, Phạm Hùng");
        currentDeclaration.setPhone("0987654321");
        currentDeclaration.setEmail("an.nguyen@example.com");
    }

    @Override
    public MedicalDeclaration getCurrentDeclaration() {
        return currentDeclaration;
    }

    @Override
    public void updateDeclaration(MedicalDeclaration declaration) {
        this.currentDeclaration = declaration;
    }

    @Override
    public boolean hasDeclaration() {
        return currentDeclaration != null && currentDeclaration.getName() != null;
    }
}
