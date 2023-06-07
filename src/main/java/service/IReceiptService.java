package service;

import model.Cake;
import model.DetailReceipt;
import model.Receipt;

import java.util.List;

public interface IReceiptService {
    List<Receipt> searchReceipt(String tinhTrang);
    List<Cake> showListCakeOrder();
    List<Receipt> showListReceipt();
    void addReceipt(List<DetailReceipt> list, Receipt receipt);
    void deleteRecript(int id);
}
