package repository;

import model.Cake;
import model.DetailReceipt;
import model.Receipt;

import java.util.List;

public interface IReceiptRepository {
    List<Cake> showListCakeOrder();

    void addReceipt(List<DetailReceipt> list, Receipt receipt);
}
