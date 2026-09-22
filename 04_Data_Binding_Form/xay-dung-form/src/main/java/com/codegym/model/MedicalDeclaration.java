package com.codegym.model;

public class MedicalDeclaration {
    // Thông tin cá nhân
    private String name;
    private String birthYear;
    private String gender;
    private String nationality;
    private String idCard;

    // Thông tin đi lại
    private String vehicle;
    private String vehicleNumber;
    private String seatNumber;
    private String departureDate;
    private String arrivalDate;
    private String travelHistory;

    // Địa chỉ liên lạc tại Việt Nam
    private String province;
    private String district;
    private String ward;
    private String address;
    private String phone;
    private String email;

    // Triệu chứng trong vòng 14 ngày qua
    private boolean fever;
    private boolean cough;
    private boolean shortnessOfBreath;
    private boolean soreThroat;
    private boolean vomiting;
    private boolean diarrhea;
    private boolean bleeding;
    private boolean rash;

    // Lịch sử phơi nhiễm trong 14 ngày qua
    private boolean contactWithPatient;
    private boolean contactWithTraveler;
    private boolean contactWithSymptomatic;

    public MedicalDeclaration() {
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(String birthYear) {
        this.birthYear = birthYear;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getVehicle() {
        return vehicle;
    }

    public void setVehicle(String vehicle) {
        this.vehicle = vehicle;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(String departureDate) {
        this.departureDate = departureDate;
    }

    public String getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(String arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getTravelHistory() {
        return travelHistory;
    }

    public void setTravelHistory(String travelHistory) {
        this.travelHistory = travelHistory;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isFever() {
        return fever;
    }

    public void setFever(boolean fever) {
        this.fever = fever;
    }

    public boolean isCough() {
        return cough;
    }

    public void setCough(boolean cough) {
        this.cough = cough;
    }

    public boolean isShortnessOfBreath() {
        return shortnessOfBreath;
    }

    public void setShortnessOfBreath(boolean shortnessOfBreath) {
        this.shortnessOfBreath = shortnessOfBreath;
    }

    public boolean isSoreThroat() {
        return soreThroat;
    }

    public void setSoreThroat(boolean soreThroat) {
        this.soreThroat = soreThroat;
    }

    public boolean isVomiting() {
        return vomiting;
    }

    public void setVomiting(boolean vomiting) {
        this.vomiting = vomiting;
    }

    public boolean isDiarrhea() {
        return diarrhea;
    }

    public void setDiarrhea(boolean diarrhea) {
        this.diarrhea = diarrhea;
    }

    public boolean isBleeding() {
        return bleeding;
    }

    public void setBleeding(boolean bleeding) {
        this.bleeding = bleeding;
    }

    public boolean isRash() {
        return rash;
    }

    public void setRash(boolean rash) {
        this.rash = rash;
    }

    public boolean isContactWithPatient() {
        return contactWithPatient;
    }

    public void setContactWithPatient(boolean contactWithPatient) {
        this.contactWithPatient = contactWithPatient;
    }

    public boolean isContactWithTraveler() {
        return contactWithTraveler;
    }

    public void setContactWithTraveler(boolean contactWithTraveler) {
        this.contactWithTraveler = contactWithTraveler;
    }

    public boolean isContactWithSymptomatic() {
        return contactWithSymptomatic;
    }

    public void setContactWithSymptomatic(boolean contactWithSymptomatic) {
        this.contactWithSymptomatic = contactWithSymptomatic;
    }
}
