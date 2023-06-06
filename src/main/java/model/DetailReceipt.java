package model;

public class DetailReceipt {
    private int amount;
    private Receipt receipt;
    private Cake cake;

    public DetailReceipt(int amount, Cake cake,Receipt receipt ) {
        this.amount = amount;
        this.receipt = receipt;
        this.cake = cake;
    }

    public DetailReceipt(Receipt receipt, Cake cake, int amount) {
        this.amount = amount;
        this.receipt = receipt;
        this.cake = cake;
    }

    public DetailReceipt(int amount, Cake cake) {
        this.amount = amount;
        this.cake = cake;
    }

    public DetailReceipt() {
    }


    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Receipt getReceipt() {
        return receipt;
    }

    public void setReceipt(Receipt receipt) {
        this.receipt = receipt;
    }

    public Cake getCake() {
        return cake;
    }

    public void setCake(Cake cake) {
        this.cake = cake;
    }
}
