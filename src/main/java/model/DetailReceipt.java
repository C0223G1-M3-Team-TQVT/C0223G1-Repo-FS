package model;

public class DetailReceipt {

    private int amount;
    private Cake cake;
    private Receipt receipt;

    public DetailReceipt() {
    }

    public DetailReceipt(int amount, Cake cake) {
        this.amount = amount;
        this.cake = cake;
    }

    public DetailReceipt(int amount, Receipt receipt) {
        this.amount = amount;
        this.receipt = receipt;
    }

    public DetailReceipt(int amount, Cake cake, Receipt receipt) {
        this.amount = amount;
        this.cake = cake;
        this.receipt = receipt;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Cake getCake() {
        return cake;
    }

    public void setCake(Cake cake) {
        this.cake = cake;
    }

    public Receipt getReceipt() {
        return receipt;
    }

    public void setReceipt(Receipt receipt) {
        this.receipt = receipt;
    }
}
