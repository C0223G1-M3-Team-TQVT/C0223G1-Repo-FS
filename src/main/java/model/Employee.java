package model;

public class Employee {
    private int id;
    private String name;
    private String citizenId;
    private String phoneNumber;
    private String address;
    private Position position;
    private User user;

    public Employee(int id, String name, String citizenId, String phoneNumber, String address, Position position, User user) {
        this.id = id;
        this.name = name;
        this.citizenId = citizenId;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.position = position;
        this.user = user;
    }

    public Employee(int id, String name, String citizenId, String phoneNumber, String address, Position position) {
        this.id = id;
        this.name = name;
        this.citizenId = citizenId;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.position = position;
    }

    public Employee(String name, String citizenId, String phoneNumber, String address, Position position) {
        this.name = name;
        this.citizenId = citizenId;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.position = position;
    }

    public Employee(String name, String citizenId, String phoneNumber, String address) {
        this.name = name;
        this.citizenId = citizenId;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public Employee(int id, String name, String citizenId, String phoneNumber, String address) {
        this.id = id;
        this.name = name;
        this.citizenId = citizenId;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public Employee(){

    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCitizenId() {
        return citizenId;
    }

    public void setCitizenId(String citizenId) {
        this.citizenId = citizenId;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Position getPosition() {
        return position;
    }

    public void setPositionId(int positionId) {
        this.position = position;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
