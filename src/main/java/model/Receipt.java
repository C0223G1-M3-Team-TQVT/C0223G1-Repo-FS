package model;

import java.time.LocalDateTime;
import java.util.Date;


public class Receipt {
    private int id;
    private Customer customer;
    private Employee employee;
    private LocalDateTime date;
    private boolean condition;
    private String address;
    private String describe;


    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Receipt(Customer customer, Employee employee, String address, String describe) {
        this.customer = customer;
        this.employee = employee;
        this.address = address;
        this.describe = describe;
    }

    public Receipt(int id, Customer customer, Employee employee, LocalDateTime date, String address, boolean condition, String describe) {
        this.id = id;
        this.customer = customer;
        this.employee = employee;
        this.date = date;
        this.address = address;
        this.condition = condition;
        this.describe = describe;
    }

    public Receipt(int id) {
        this.id = id;
    }
    public Receipt(int id, Customer customer) {
        this.id = id;
        this.customer = customer;
    }

    public Receipt(Customer customer, Employee employee, LocalDateTime date, String address) {
        this.customer = customer;
        this.employee = employee;
        this.date = date;
        this.address = address;
    }

    public Receipt(Customer customer, Employee employee, String address) {
        this.customer = customer;
        this.employee = employee;
        this.address = address;
    }

    public Receipt(LocalDateTime date, String address) {
        this.date = date;
        this.address = address;
    }

    public Receipt() {
    }

    public Receipt(int id, Customer customer, Employee employee, LocalDateTime ngayDatHang, String diaChi, boolean condition) {
        this.id=id;
        this.customer = customer;
        this.employee = employee;
        this.date = ngayDatHang;
        this.address = diaChi;
        this.condition=condition;
    }

    public Receipt(int id, Customer customer, Employee employee, LocalDateTime ngayDatHang, String diaChi) {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isCondition() {
        return condition;
    }

    public void setCondition(boolean condition) {
        this.condition = condition;
    }

}
