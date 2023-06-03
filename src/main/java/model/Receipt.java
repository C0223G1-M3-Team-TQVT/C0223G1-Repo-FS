package model;

import java.util.Date;

public class Receipt {
    private int id;
    private Customer customer;
    private Employee employee;
    private Date date;
    private String address;

    public Receipt(int id, Customer customer, Employee employee, Date date, String address) {
        this.id = id;
        this.customer = customer;
        this.employee = employee;
        this.date = date;
        this.address = address;
    }

    public Receipt() {
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
