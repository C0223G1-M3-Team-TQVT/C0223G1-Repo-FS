package model;

public class Cake {
    private int id;
    private String name;
    private int typeOfCake;
    private double price;
    private int amount;
    private String picture;


    public Cake(int id, String name, double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    public Cake(int id, String name, int typeOfCake, double price, int amount, String picture) {
        this.id = id;
        this.name = name;
        this.typeOfCake = typeOfCake;
        this.price = price;
        this.amount = amount;
        this.picture = picture;
    }

    public Cake(String name) {
        this.name = name;
    }

    public Cake(int id, String name, int typeOfCake, double price) {
        this.id = id;
        this.name = name;
        this.typeOfCake = typeOfCake;
        this.price = price;
    }

    public Cake(int id, String name, int typeOfCake, double price, int amount) {
        this.id = id;
        this.name = name;
        this.typeOfCake = typeOfCake;
        this.price = price;
        this.amount = amount;
    }

    public Cake(int id) {
        this.id = id;
    }

    public Cake(String name, int typeOfCake, double price) {
        this.name = name;
        this.typeOfCake = typeOfCake;
        this.price = price;
    }

    public Cake() {
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
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

    public int getTypeOfCake() {
        return typeOfCake;
    }

    public void setTypeOfCake(int typeOfCake) {
        this.typeOfCake = typeOfCake;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
