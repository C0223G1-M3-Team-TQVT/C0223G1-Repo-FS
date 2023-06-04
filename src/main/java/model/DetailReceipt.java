package model;

public class DetailReceipt {
    private int receiptId;
    private int cakeId;
    private int amount;

    public DetailReceipt(int receiptId, int cakeId, int amount) {
        this.receiptId = receiptId;
        this.cakeId = cakeId;
        this.amount = amount;
    }

    public DetailReceipt(int cakeId, int amount) {
        this.cakeId = cakeId;
        this.amount = amount;
    }

    public DetailReceipt() {
    }

    public int getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(int receiptId) {
        this.receiptId = receiptId;
    }

    public int getCakeId() {
        return cakeId;
    }

    public void setCakeId(int cakeId) {
        this.cakeId = cakeId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
