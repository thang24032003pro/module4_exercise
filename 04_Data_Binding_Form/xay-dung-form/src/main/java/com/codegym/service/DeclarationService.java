package com.codegym.service;

import com.codegym.model.MedicalDeclaration;

public interface DeclarationService {
    MedicalDeclaration getCurrentDeclaration();
    void updateDeclaration(MedicalDeclaration declaration);
    boolean hasDeclaration();
}
